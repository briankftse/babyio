app.forms.Baby = Backbone.View.extend({

  events: {
    "submit #new-baby":  "createBaby"
  },

  initialize: function() {
    this.render();
  },

  render: function() {
    $(this.el).html(HandlebarsTemplates['forms/baby']);
    $('.datepicker').datepicker();

    return this;
  },

  createBaby: function() {
    var attrs = $("#new-baby").serializeArray(),
      bb_attrs = {};

    _.each(attrs, function(attr, i) {
      if(attr.name === "birthday") {
        bb_attrs[attr.name] = moment(attr.value).format("YYYY-MM-DD");
      } else {
        bb_attrs[attr.name] = attr.value;
      }
    });

    console.log(bb_attrs);

    var baby = new app.models.Baby(bb_attrs);

    baby.save({}, {
      success: function() {
        app.currentUser.babies.add(baby);
      }
    });

    return false;
  }

});
