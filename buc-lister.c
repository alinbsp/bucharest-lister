#include <stdio.h>
#include <kclangc.h>

#ifdef WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

void test_function()
{
  printf("ok 1\n");
  fflush(stdout);
}

void create_db( const char *db_name ) {
  KCDB* db;
  KCCUR* cur;
  char *kbuf, *vbuf;
  size_t ksiz, vsiz;
  const char *cvbuf;

  /* create the database object */
  db = kcdbnew();
  printf("%s\n", db_name);
  //static char *cached_str = NULL;
  //cached_str = db_name;
  
  /* open the database */
  if (!kcdbopen(db, db_name, KCOWRITER | KCOCREATE)) {
    fprintf(stderr, "open error: %s\n", kcecodename(kcdbecode(db)));
  }
}
