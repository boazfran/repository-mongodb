set -m
# run mongod in the background and give it 10 seconds to start properly
mongod &
sleep 10
# start the query plan
cd /app && mongo --quiet ireceptor /app/scripts/create_query_plans.js
# return the mongod to the foreground
fg
