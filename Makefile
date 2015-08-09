CFLAGS += -g -O0 --std=c99
LDFLAGS += -lcurl -lbluetooth

SRC = ttblue.c \
      bbatt.c

HEADERS = bbatt.h \
          att-types.h

OUTPUT = ttblue

all: $(OUTPUT)

$(SRC:.c=.o): $(HEADERS)

%.o: %.c
	@echo Compiling $@...
	$(CC) -c $(CFLAGS) $< -o $*.o

$(OUTPUT): $(SRC:.c=.o)
	@echo Linking $(OUTPUT)...
	$(CC) -o $(OUTPUT) $(SRC:.c=.o) $(LDFLAGS)

clean:
	@-rm $(OUTPUT) $(SRC:.c=.o) >/dev/null 2>&1