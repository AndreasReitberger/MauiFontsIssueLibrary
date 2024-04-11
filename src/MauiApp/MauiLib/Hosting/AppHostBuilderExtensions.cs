namespace MauiLib.Hosting
{
    public static class AppHostBuilderExtensions
    {
        public static MauiAppBuilder InitializeSharedMauiStyles(this MauiAppBuilder builder)
        {
            builder.RegisterSharedFonts();
            return builder;
        }

        public static MauiAppBuilder RegisterSharedFonts(this MauiAppBuilder builder)
        {
            builder
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("materialdesignicons-webfont.ttf", "MaterialDesignIcons");
                });
            return builder;
        }
    }
}
