const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*'
  ],
  theme: {
    extend: {
      screens: {
        'xs': '400px',
        ...defaultTheme.screens,
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      colors: { // custom color palette for branding
        'primary': 'rgb(79, 70, 229)',
        'primary-hover-700': {
          '700': '#a4411c', // use https://pinetools.com/darken-color
          '500': '#EA9A72'
        },
        'black-30': 'rgba(0, 0, 0, 0.3)',

        // Override existing gray
        'gray': {
          200: '#F5F5F5'
        }
      },
      height: {
        '128': '32rem',
      },
      width: {
        '128': '32rem',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
