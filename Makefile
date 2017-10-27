#
XINCSEARCH = -I/usr/X11R6/include -I/usr/include/Motif1.2  -I/usr/local/include -I$(INCLUDEDIR)/GL 
XLIBSEARCH = -L/usr/X11R6/lib -L/usr/local/lib/Motif1.2
TARGETS = transformation projection lightposition texture lightmaterial fog
#LLDLIBS = -lglut -lGLU -lGL -lXmu -lXext -lX11 -lm
#LCFLAGS = -fullwarn
SEARCH = ${XINCSEARCH} ${XLIBSEARCH}

CC = gcc 

LDLIBS = -lglut -lGLU -lGL -lXmu -lXext -lXi -lXext -lX11 -lm 


default: $(TARGETS)

glm.o : glm.c
	$(CC) -c glm.c $(LDLIBS) -o $@ ${SEARCH}


transformation: transformation.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

projection: projection.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

lightposition: lightposition.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

texture: texture.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

lightmaterial: lightmaterial.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

fog: fog.o glm.o sgi.o
	$(CC) -o $@ $@.o glm.o sgi.o $(LDLIBS) ${SEARCH}

