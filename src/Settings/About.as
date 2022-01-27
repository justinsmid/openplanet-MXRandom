[SettingsTab name="About"]
void RenderAboutTab()
{
    if (MX::APIDown)
    {
        if (!MX::APIRefreshing)
        {
            UI::Text("\\$fc0"+Icons::ExclamationTriangle);
            UI::SameLine();
            UI::PushFont(g_fontHeaderSub);
            UI::Text("\\$fc0"+MX_NAME + " is not responding. It might be down.");
            UI::PopFont();
            if (UI::Button("Retry")) startnew(MX::FetchMapTags);
        }
        else
        {
            int HourGlassValue = Time::Stamp % 3;
            string Hourglass = (HourGlassValue == 0 ? Icons::HourglassStart : (HourGlassValue == 1 ? Icons::HourglassHalf : Icons::HourglassEnd));
            UI::TextDisabled(Hourglass + " Loading...");
        }
        UI::Separator();
    }

    UI::Text(MX_COLOR_STR + Icons::Random);
    UI::SameLine();
    UI::PushFont(g_fontHeader);
    UI::Text(PLUGIN_NAME);
    UI::PopFont();
    UI::Text("Made by \\$777" + Meta::ExecutingPlugin().get_Author() + " \\$aaaand its contributors");
    UI::Text("Version \\$777" + Meta::ExecutingPlugin().get_Version());
    UI::Text("Plugin ID \\$777" + Meta::ExecutingPlugin().get_ID());
    UI::Text("Site ID \\$777" + Meta::ExecutingPlugin().get_SiteID());
    UI::Text("Type \\$777" + tostring(Meta::ExecutingPlugin().get_Type()));
    if (IS_DEV_MODE) {
        UI::SameLine();
        UI::Text("\\$777(\\$f39"+Icons::Code+" \\$777Dev mode)");
    }

    if (UI::Button(Icons::Heart + " Donate")) OpenBrowserURL("https://github.com/sponsors/GreepTheSheep");
    UI::SameLine();
    if (UI::Button(Icons::Kenney::GithubAlt + " Github")) OpenBrowserURL(GITHUB_URL);
    UI::SameLine();
    if (UI::Button(Icons::DiscordAlt + " Discord")) OpenBrowserURL("https://greep.gq/discord");
    UI::SameLine();
    if (UI::Button(Icons::Heartbeat + " Plugin Home")) OpenBrowserURL("https://openplanet.nl/files/" + Meta::ExecutingPlugin().get_SiteID());

    UI::Separator();

    UI::Text("\\$f39" + Icons::Heartbeat);
    UI::SameLine();
    UI::PushFont(g_fontHeaderSub);
    UI::Text("Openplanet");
    UI::PopFont();
    UI::Text("Version \\$777" + Meta::OpenplanetBuildInfo());

    UI::Separator();

    UI::Text(MX_COLOR_STR + Icons::Exchange);
    UI::SameLine();
    UI::PushFont(g_fontHeaderSub);
    UI::Text("ManiaExchange");
    UI::PopFont();
    if (UI::Button(Icons::KeyboardO + " \\$zContact ManiaExchange")) OpenBrowserURL("https://"+MX_URL+"/messaging/compose/11");
    UI::SameLine();
    if (UI::RedButton(Icons::Heart + " \\$zSupport ManiaExchange")) OpenBrowserURL("https://"+MX_URL+"/support");

    UI::Text("Base URL \\$777" + MX_URL);

    UI::Text("Follow the ManiaExchange network on");
    UI::SameLine();
    if (UI::Button(Icons::Facebook + " Facebook")) OpenBrowserURL("https://facebook.com/maniaexchange/");
    UI::SameLine();
    if (UI::Button(Icons::Twitter + " Twitter")) OpenBrowserURL("https://twitter.com/maniaexchange/");
    UI::SameLine();
    if (UI::Button(Icons::YoutubePlay + " YouTube")) OpenBrowserURL("https://youtube.com/maniaexchangetracks/");
    UI::SameLine();
    if (UI::Button(Icons::DiscordAlt + " Discord")) OpenBrowserURL("https://discord.mania.exchange/");
}