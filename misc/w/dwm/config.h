/* See LICENSE file for copyright and license details. */

/* appearance */
static const char *fonts[] = {
    "artwiz anorexia:size=9"
};
static const char dmenufont[]       = "Space Mono:size=28";
static const char normbordercolor[] = "#ffffff";
static const char normbgcolor[]     = "#ffffff";
static const char normfgcolor[]     = "#000000";
static const char selbordercolor[]  = "#ff0000";
static const char selbgcolor[]      = "#e5e5e5";
static const char selfgcolor[]      = "#000000";
static const unsigned int borderpx  = 1;
static const unsigned int snap      = 32;
static const int showbar            = 1;
static const int topbar             = 1;

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };


/* layout(s) */
static const float mfact     = 0.55;
static const int nmaster     = 1;
static const int resizehints = 0;

static const Rule rules[] = {
  /* class|instance|title|tags mask|isfloating|monitor */
  { "dunno", NULL, NULL, 1 << 8, 1, -1 },
};

static const Layout layouts[] = {
	{ "[]=",      tile },
	{ "><>",      NULL },
    { "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
    "dmenu_run",
    "-m", dmenumon,
    "-fn", dmenufont,
    "-nb", normbgcolor,
    "-nf", normfgcolor,
    "-sb", selbgcolor,
    "-sf", selfgcolor,
    NULL
};
static const char *termcmd[]  = { "alacritty", NULL };

static Key keys[] = {
	/* modifier         key        function        argument */
	{ NULL,             XK_F2,     spawn,          {.v = dmenucmd } },
	{ NULL,             XK_F1,     spawn,          {.v = termcmd } },
	{ MODKEY,           XK_b,      togglebar,      {0} },
	{ MODKEY,           XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,           XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,           XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,           XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,           XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,           XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,           XK_Return, zoom,           {0} },
	{ MODKEY,           XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask, XK_c,      killclient,     {0} },
	{ MODKEY,           XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,           XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,           XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,           XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask, XK_space,  togglefloating, {0} },
	{ MODKEY,           XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask, XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,           XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,           XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask, XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask, XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(            XK_1,                      0)
	TAGKEYS(            XK_2,                      1)
	TAGKEYS(            XK_3,                      2)
	TAGKEYS(            XK_4,                      3)
	TAGKEYS(            XK_5,                      4)
	TAGKEYS(            XK_6,                      5)
	TAGKEYS(            XK_7,                      6)
	TAGKEYS(            XK_8,                      7)
	TAGKEYS(            XK_9,                      8)
	{ MODKEY|ShiftMask, XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
