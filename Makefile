CFLAGS=-g -Wall -I/usr/include/libxml2 -DLINUX
LDFLAGS=-L/opt/local/lib -lcrypto -lcurl -lssl -lxml2 -lbsd

OBJS=s3test.o s3string.o s3digest.o s3ops.o

all: s3test

s3test: $(OBJS)

valgrind: s3test
	valgrind --leak-check=full ./s3test

clean:
	rm -f $(OBJS)
