
export default defineNuxtConfig({
  devtools: { enabled: false },
  ssr: process.env.SSR_ENABLED == 'true',
  app: {
    head: {}
  },
  modules: [
    '@nuxtjs/i18n',
    '@vueuse/nuxt',
  ],
  i18n: {
    defaultLocale: 'en',
    trailingSlash: false,
    detectBrowserLanguage: false,
    locales: [
      {
        code: 'en',
        iso: 'en-CA',
        name: 'English',
        language: 'en',
        file: 'en.json',
      },
      {
        code: 'fr',
        iso: 'fr-CA',
        name: 'Français',
        language: 'fr',
        file: 'fr.json',
      },
    ],
    langDir: 'locales',
    customRoutes: 'config',
    pages: {
      "[slug]": {
        fr: "/[slug]",
        en: "/[slug]",
      }
    },
  },
  nitro: {
    prerender: {
      autoSubfolderIndex: false,
      concurrency: 1,
      interval: 250
    },
  },
  hooks: {
  },
  site: {
    url: process.env.BASE_URL,
  },
})