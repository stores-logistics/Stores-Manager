const express = require("express");
const Store = require('../models/Store');

const router = express.Router();

router.get('/', (req, res, next) => {
    Store.fetchAll().
    then((store) => {
        res.json(store);
    });
});

router.get('/:id', (req, res, next) => {
    Store.where({id : req.params.id})
    .fetch()
    .then((store) => {
        res.json(store);
    })
});

router.post('/', (req, res, next) => {
    if(Object.keys(req.body).length == 5){
        Store.forge({
            name        : req.body.name,
            type        : req.body.type,
            owner       : req.body.owner,
            ubication   : req.body.ubication,
            dates       : req.body.dates
        })
        .save()
        .then(saved => {
            res.json(saved);
        });
    } else
        res.status(400).send('Missing parameters.');
});

router.delete('/:id', (req, res, next) => {
    Store.forge({id : req.params.id})
    .fetch()
    .then(store => {
        store.destroy()
        .then(() => {
            res.json("Store deleted");
        });
    });
});

router.patch('/:id', (req, res, next) => {
    Store.where({id : req.params.id})
    .fetch()
    .then(store => {
        store.save({
            name          : store.name || req.body.name,
            type          : store.type || req.body.type,
            owner         : store.owner || req.body.owner,
            ubication     : store.ubication || req.body.ubication,
            dates         : store.dates || req.body.dates
        },{
            method : 'update',
            patch  : true
        })
        .then(update => {
            res.json(update);
        });
    });
});

module.exports = router;