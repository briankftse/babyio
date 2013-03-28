app.views.BabyLink = Backbone.View.extend({

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).append( HandlebarsTemplates['baby-link']({
      fullname: this.model.full_name(),
      username: this.model.get("username")
    }));

    return this;
  }

});
