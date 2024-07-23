#include <unistd.h>
#include <grp.h>
#include <sys/fsuid.h>
#include <sys/wait.h>

#include <stdio.h>
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

    fprintf(log, "\n");
    fflush(log);

    pid_t child = fork();
    if( child==-1 ) {
        fprintf(log, "Failed to fork: %s\n", strerror(errno));

        return 1;
    }

    if( child==0 ) {
        // Child
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
