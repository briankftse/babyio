app.views.CreateBabyLink = Backbone.View.extend({

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).append( HandlebarsTemplates['create-baby-link'] );

    return this;
  }

});
