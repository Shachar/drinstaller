FROM rocky-8.6

# Set root passwd
RUN echo 'root:123123' | chpasswd

