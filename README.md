# stockpile
Holonic Warehouse System

Prepare development environment

check syntax
https://github.com/okbob/plpgsql_check

unit tests with pgunit
https://github.com/danblack/pgunit-sql

unit tests with pgtap 
https://github.com/theory/pgtap

debug
https://github.com/soycacan/pldebugger

autodoc
https://github.com/cbbrowne/autodoc

profiler
https://github.com/glynastill/plprofiler

PL/pgSQL stored procedure code coverage tool
https://github.com/kputnam/piggly

migration scripts management
.

## pldebugger
git clone git://git.postgresql.org/git/pldebugger.git  
  
cd pldebugger  
  
export PATH=/home/digoal/pgsql9.6/bin:$PATH  
  
USE_PGXS=1 make clean  
USE_PGXS=1 make  
USE_PGXS=1 make install 

cd $PGDATA  
vi postgresql.conf  
  
shared_preload_libraries = '$libdir/plugin_debugger'  
