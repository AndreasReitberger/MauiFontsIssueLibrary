using MauiLib.Hosting;
using Microsoft.Extensions.Logging;
using System.Diagnostics;

namespace MauiAppTest
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                // Init fonts from library
                .InitializeSharedMauiStyles()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");

#if DEBUG
                    foreach (var f in fonts)
                    {
                        Debug.WriteLine($"Font: {f.Filename} / {f.Alias}");
                    }
#endif
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif

            return builder.Build();
        }
    }
}
