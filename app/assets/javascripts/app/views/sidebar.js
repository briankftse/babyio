app.views.Sidebar = Backbone.View.extend({
  className: "sidebar",

  initialize: function() {
    var self = this;

    app.currentUser.babies.on("add", function(baby){
      self.addBabyLink(baby);
    });

    this.render();
  },

  render: function() {
    var self = this;

    $(this.el).html( HandlebarsTemplates['sidebar'] );

    app.currentUser.babies.each(function(baby) {
      self.addBabyLink(baby);
    });

    var link_view = new app.views.CreateBabyLink({
      el: $(".nav-list")
    });

  },

  addBabyLink: function(baby) {
    var link_view = new app.views.BabyLink({
      model: baby,
      el: $(".nav-list")
    });
  }

});
