// Update with your config settings.

module.exports = {

  development: {
    client: 'mysql',
    connection: {
      database: process.env.MYSQL_DATABASE,  // make sure you create this db
      user: 'root',         // can be something else
      password: '',         // your corresponding password
      host: process.env.MYSQL_HOST,
      port: '',          // Default port
    },
    migrations: {
      directory: 'migrations'
    }
  },
  staging: {
    client: 'mysql',
    connection: {
      database: process.env.MYSQL_DATABASE,
      user:     'root',
      password: 'root'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      directory: 'migrations'
    }
  },
  production: {
    client: 'mysql',
    connection: {
      database: process.env.MYSQL_DATABASE,
      user:     'root',
      password: 'root'
    },
    pool: {
      min: 2,
      max: 10
    },
    migrations: {
      directory: 'migrations'
    }
  }

};
