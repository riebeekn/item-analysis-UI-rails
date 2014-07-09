# !/bin/bash

#################################################################################
# USAGE:  chmod +x setup-local-dbs.sh
#         ./setup-local-dbs
#################################################################################
createuser item_analysis --createdb
createdb -Oitem_analysis -Eutf8 item_analysis_development
createdb -Oitem_analysis -Eutf8 item_analysis_test

rake db:migrate
rake db:test:prepare