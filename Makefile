NAME = scop

CXXFLAGS = -Wall -Wextra -Werror -std=c++11
CC = g++

SRC = $(wildcard src/*.cpp)
OBJ = $(SRC:%.cpp=%.o)
INC = -I ./include

LDFLAGS = -L ./lib/libglfw3 -lglfw3 -ldl
LDFLAGS += -lX11 -lpthread

%.o: %.cpp Makefile $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@  $(INC) $(LDFLAGS)

%/glad.o: %/glad.c
	$(CC) $(CFLAGS) -c $< -o $@  $(INC)

all : $(NAME)

$(NAME) : $(OBJ) src/glad.o $(HEADERS)
	$(CC) $(CFLAGS) $(OBJ) src/glad.o -o $(NAME) $(INC) $(LDFLAGS)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME)

re: fclean all

.PHONY: all clean fclean re