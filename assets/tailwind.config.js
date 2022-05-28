module.exports = {
  content: [
    './js/**/*.js',
    '../lib/*_web.ex',
    '../lib/*_web/**/*.*ex',
  ],
  theme: {
    extend: {
      fontFamily: {
        primary: ['Rubik']
      },
      colors : {
        primary: '#4999DF',
        accent: '#4e5f6e',
        dark: '#1d252b',
        grayLight: '#e8ecf2'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms')({
      strategy: 'class',
    }),
  ],
}
