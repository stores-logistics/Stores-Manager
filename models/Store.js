'use strict';

const Bookshelf = require('../bookshelf');

class Store extends Bookshelf.Model{

    get tableName(){
        return 'stores'
    }

}

module.exports = Bookshelf.model('Store', Store);