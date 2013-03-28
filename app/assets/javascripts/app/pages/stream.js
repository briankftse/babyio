app.pages.Stream = Backbone.View.extend({
  className: "stream",

  events: {
    "submit #new-post":  "createPost"
  },

  initialize: function(options) {
    //this.collection = new app.collections.Posts();
    //this.collection.username = options.username;

    //this.collection.bind('reset', this.render, this);
    //this.collection.bind("reset", this.addAll, this);
    //this.collection.bind("add", this.addOne, this);

    //this.collection.fetch();
    this.render();
  },

  render: function() {
    $(".content").html(this.el);

    var sidebar = new app.views.Sidebar({ el: $(".sidebar") });
    this.addAll();

    return this;
  },

  createPost: function(e) {
    var arr = $(e.target).serializeArray(),
      obj = {},
      i = 0;

    for (i = 0; i < arr.length; i += 1) {
      obj[arr[i].name] = arr[i].value;
    }

    this.collection.create(obj);

    // Clear the form
    $(e.target).find("input[type=text], textarea").val("");

    return false;
  },

  addAll: function() {
    var self = this,
      row_el = null;

    this.model.posts.each(function(post, i) {
      if( i % 3 === 0 ) {
        row_el = new app.views.PostRow().el;
        self.$el.append(row_el);
      }

      self.addOne(post, self.collection, row_el);
    });

    return this;
  },

  addOne: function(post, collection, row_el) {
    var post_dom = new app.views.Post({ model: post }).render().el;
    $(row_el).append(post_dom);
  }

});
