export default defineI18nConfig(() => ({
  fallbackLocale: 'fr',
  allowComposition: true,
  locales: [
    {
      code: 'en',
      file: 'en.json',
    },
    {
      code: 'fr',
      file: 'fr.json',
    },
  ],
  langDir: 'locales',
}))
