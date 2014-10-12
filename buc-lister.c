#include <stdio.h>
#include <kclangc.h>

#ifdef WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT extern
#endif

KCDB* open_db( const char *db_name ) {
  KCDB* db;

  /* create the database object */
  db = kcdbnew();
  
  /* open the database */
  if (!kcdbopen(db, db_name, KCOWRITER | KCOCREATE)) {
    fprintf(stderr, "open error: %s\n", kcecodename(kcdbecode(db)));
  }

  return db;
}

void store_db( KCDB* db, char *key, char *value ) {
  /* store record */
  size_t ksiz = strlen(key);
  size_t vsiz = strlen(value);

  if (!kcdbset(db, key, ksiz, value, vsiz))  {
    fprintf(stderr, "set error: %s\n", kcecodename(kcdbecode(db)));
  } 
}

char* retrieve_db( KCDB* db, char *key) {
  /* retrive record value */
  size_t ksiz = strlen(key);
  size_t vsiz;

  char* vbuf = kcdbget(db, key, ksiz, &vsiz);
  char* tm;
  if (vbuf) {
    return vbuf;
    kcfree(vbuf);
  } else {
    return tm;
  }
}

