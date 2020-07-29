const db = require('../data/db-config')

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
}

async function find() {
  return await db("schemes")
}

async function findById(id) {
  return await db('schemes').where({id})
}

function findSteps(id) {
  return db('schemes as sc')
                .join('steps as s', 'sc.id', 's.scheme_id')
                .select('s.id', 'sc.scheme_name', 's.step_number', 's.instructions')
                .where("sc.id", id)
                .orderBy('s.step_number')
}

async function add(scheme) {
  return db('schemes')
        .insert(scheme)
        .then(id => findById(id[0]))
}

function update(changes, id) {
  return db('schemes')
    .where({id})
    .update(changes)
    .then(changed => {
      return findById(id)
    });
}

async function remove(id){
  const removed = await findById(id)
  return db('schemes')
          .where('id', id)
          .del()
          .then(deleted => {
            return removed
          });
}