# docker-kairosdb

Requires a cassandra instance running (with thrift).  By default will try to connect to `cassandra`.  Override by specifying CASSANDRA environment variable.

TODO: Currently assumes default cassandra ports (9042, 9160)

Example docker-compose.yaml

    ---
    version: "2"

    services:
      cassandra:
        image: t0mmyt/cassandra
        ports:
          - 9042:9042
          - 9160:9160
      kairosdb:
        image: t0mmyt/kairosdb
        ports:
          - 127.0.0.1:4242:4242
          - 127.0.0.1:8083:8083
