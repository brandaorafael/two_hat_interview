FROM mongo

ENV MONGO_INITDB_ROOT_USERNAME admin
ENV MONGO_INITDB_ROOT_PASSWORD pass

ENV MONGODB_USER twoHatUser
ENV MONGODB_DATABASE two_hat
ENV MONGODB_PASS twoHatPass

ADD data.json data.json

ADD init_user_and_data.sh docker-entrypoint-initdb.d/init_user_and_data.sh