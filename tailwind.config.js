module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    screens:  {
      sm: '480px',
      md: '768px',
      lg: '976px',
      xl: '1440px'
    }
  }
}
