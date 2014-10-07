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
