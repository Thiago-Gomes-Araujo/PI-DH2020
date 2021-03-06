const { Contact, Sequelize } = require("../models");

module.exports = {
  async list(req, res, next) {
    let { page = 1 } = req.query;
    page = parseInt(page);
    let limit = 10;

    let contacts = await Contact.findAll({
      where: {
        deleted: 0
      },
      limit: limit,
      offset: ((page - 1) * limit)
    });
    
    let total = contacts.length;

    res.render('contacts', { contacts, user: req.session.user, page, total });
  },

  async create(req, res, next) {
    let cards = await Card.findAll();

  let contact = { ...req.body };
    await Contact.create(contact);

    res.render('index', { cards, added: true });
  }, 

  async edit(req, res, next) {
    let id = req.params.id;
    let contact = await Contact.findByPk(id);

    res.render('edit-contact', { contact });
  },

  async update(req, res, next) {
    let id = req.params.id;
    let contact = await Contact.findByPk(id);

    let { nome, email, mensagem } = req.body;

    contact.name = nome;
    contact.email = email;
    contact.message = mensagem;

    await contact.save();

    res.render('edit-contact', { contact, updated: true })
  },

  async delete(req, res, next) {
    let id = req.params.id;
    let contact = await Contact.findByPk(id);

    contact.deleted = true;

    await contact.save();

    let contacts = await Contact.findAll({
      where: {
        deleted: 0
      }
    });
    
    res.render('contacts', { contacts, deleted: true });
  },

  async search(req, res, next) {
    let { word = '', page = 1 } = req.query;
    page = parseInt(page);
    let limit = 10;

    let contacts = await Contact.findAll({
      where: {
        email: {
          [Sequelize.Op.like]: `%${word}%`
        },
        deleted: 0
      },
      limit: limit,
      offset: ((page - 1) * limit)
    });
    
    let total = contacts.length;

    res.render('contacts', { contacts, user: req.session.user, page, total, word });
  }
}



