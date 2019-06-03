
exports.up = function(knex, Promise) {
  return knex.schema.createTable('stores', (table) => {
      table.increments('id').unsigned().primary();
      table.string('name').notNull();
      table.string('type').notNull();
      table.string('owner').notNull();
      table.string('ubication').notNull();
      table.string('dates').notNull();
  });
};
