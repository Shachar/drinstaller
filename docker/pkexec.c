#include <unistd.h>
#include <grp.h>
#include <sys/fsuid.h>
#include <sys/wait.h>
#include <sys/stat.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

int main(int argc, char *argv[], char *env[]) {
    setfsuid( getuid() );

    FILE *log = fopen("/tmp/pkexec.log", "a");
    int i;

    fprintf(log, "Running:");
    for( i=0; i<argc; ++i ) {
        fprintf(log, " \"%s\"", argv[i]);
    }

    struct stat st;
    if( stat( argv[argc-1], &st )==-1 ) {
        fprintf(log, " couldn't stat: %s\n", strerror(errno));
    } else {
        fprintf(log, ": %ld\n", st.st_size);
    }
    fflush(log);

    pid_t child = fork();
    if( child==-1 ) {
        fprintf(log, "Failed to fork: %s\n", strerror(errno));

        return 1;
    }

    if( child==0 ) {
        // Child
        char uid_buffer[20];
        snprintf(uid_buffer, 20, "%d", getuid());
        setenv("PKEXEC_UID", uid_buffer, 1);

        gid_t group[1] = {0};
        setuid(0);
        setgid(0);
        setgroups( 1, group );

        execvp(argv[1], argv + 1);

        fprintf(log, "Failed to exec: %s\n", strerror(errno));

        return 2;
    }
    
    int status;
    pid_t exited = wait( &status );

    fprintf(log, "Process %d exit with status %x\n", exited, status);

    fclose(log);

    return 0;
}
