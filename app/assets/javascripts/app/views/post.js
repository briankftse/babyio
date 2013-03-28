app.views.Post = Backbone.View.extend({
  className: "post span3 rounded-corners",

  initialize: function() {
    this.model.bind("change", this.render, this);
  },

  render: function() {
    $(this.el).html( HandlebarsTemplates['post']({
      message: this.model.get("message"),
      date: this.model.date()
    }));

    return this;
  }

});
