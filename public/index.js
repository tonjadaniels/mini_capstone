/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    axios.get("/api/products").then(function(response){
    this.products = response.data;
    console.log(this.products);
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var SamplePage = {
  template: "#sample-page",
  data: function() {
    return {
      message: "Welcome to the sample page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

// -------->

var SignupPage = {  
  template: "#signup-page",   
  data: function() { 
    return { 
      name: "", 
      email: "", 
      password: "", 
      passwordConfirmation: "", 
      errors: [] 
    }; 
  },   
  methods: { 
    submit: function() { 
      var params = { 
        name: this.name, 
        email: this.email, 
        password: this.password, 
        password_confirmation: this.passwordConfirmation 
      }; 
      axios 
      .post("/users", params) 
      .then(function(response) { 
        router.push("/login"); 
      }) 
      .catch( 
        function(error) { 
          this.errors = error.response.data.errors; 
        }.bind(this) 
        ); 
    } 
  } 
};

// -------->

var LoginPage = { 
  template: "#login-page",   
  data: function() { 
    return { 
      email: "", 
      password: "", 
      errors: [] 
    };   
  },   
  methods: { 
    submit: function() { 
      var params = { 
        auth: { email: this.email, password: this.password } 
      }; 
      axios 
      .post("/user_token", params) 
      .then(function(response) { 
        axios.defaults.headers.common["Authorization"] = 
        "Bearer " + response.data.jwt; 
        localStorage.setItem("jwt", response.data.jwt); 
        router.push("/"); 
      }) 
      .catch( 
        function(error) { 
          this.errors = ["Invalid email or password."]; 
          this.email = ""; 
          this.password = ""; 
        }.bind(this) 
      ); 
    } 
  } 
};

// -------->

var LogoutPage = {
  template: "<h1>Logout</h1>", 
  created: function() { 
    axios.defaults.headers.common["Authorization"] = undefined; 
    localStorage.removeItem("jwt"); 
    router.push("/"); 
  } 
};

// -------->

var ProductsNewPage = {
  template: "#products-new-page",
  data: function() {
    return {
      name: "",
      price: "",
      image_url: "",
      description: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        price: this.price,
        image_url: this.imageUrl,
        direction: this.direction
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};
  
// -------->

var router = new VueRouter({
  routes: [
  { path: "/", component: HomePage },
  { path: "/signup", component: SignupPage } ,
  { path: "/login", component: LoginPage },
  { path: "/logout", component: LogoutPage }
  ] ,
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
   created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});