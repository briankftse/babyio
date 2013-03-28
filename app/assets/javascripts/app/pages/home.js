app.pages.Home = Backbone.View.extend({

  className: "home",

  events: {
    "click .create-baby-form":  "createBabyForm"
  },

  initialize: function() {
    this.model.bind('change', this.render, this);

    this.model.fetch();
  },

  render: function() {
    var sidebar = new app.views.Sidebar({ el: $(".sidebar") });

    $(".content").html(
      $(this.el).html( HandlebarsTemplates['home']({
        name: this.model.get('email')
    })));

    _.each(this.model.get("babies"), function(baby) {
      var link_view = new app.views.BabyLink({
        babyname: baby.username,
        el: $('#babies')
      });
    });

    return this;
  },

  createBabyForm: function() {
    console.log('home create form');
    var baby_form = new app.forms.Baby({
      el: $('.new-baby')
    });
  }

});
