local status_ok, db = pcall(require, "dashboard")
if not status_ok then
    return
end

local headerOptions = {
	{
		[[        ___      ___      ___      ___      ___      ___       ]],
		[[        `MM      `MM      `MM      `MM      `MM      `MM       ]],
		[[         MM       MM       MM       MM       MM       MM       ]],
		[[  ____   MM  __   MM  __   MM  __   MM  __   MM  __   MM  __   ]],
		[[ 6MMMMb\ MM 6MMb  MM 6MMb  MM 6MMb  MM 6MMb  MM 6MMb  MM 6MMb  ]],
		[[MM'    ` MMM9 `Mb MMM9 `Mb MMM9 `Mb MMM9 `Mb MMM9 `Mb MMM9 `Mb ]],
		[[YM.      MM'   MM MM'   MM MM'   MM MM'   MM MM'   MM MM'   MM ]],
		[[ YMMMMb  MM    MM MM    MM MM    MM MM    MM MM    MM MM    MM ]],
		[[     `Mb MM    MM MM    MM MM    MM MM    MM MM    MM MM    MM ]],
		[[L    ,MM MM    MM MM    MM MM    MM MM    MM MM    MM MM    MM ]],
		[[MYMMMM9 _MM_  _MM_MM_  _MM_MM_  _MM_MM_  _MM_MM_  _MM_MM_  _MM_]],
		[[                                                               ]],
		[[                                                               ]]
	},
	{
		[[___               ___ ___           ]],
		[[`MM               `MM `MM           ]],
		[[ MM                MM  MM           ]],
		[[ MM  __     ____   MM  MM   _____   ]],
		[[ MM 6MMb   6MMMMb  MM  MM  6MMMMMb  ]],
		[[ MMM9 `Mb 6M'  `Mb MM  MM 6M'   `Mb ]],
		[[ MM'   MM MM    MM MM  MM MM     MM ]],
		[[ MM    MM MMMMMMMM MM  MM MM     MM ]],
		[[ MM    MM MM       MM  MM MM     MM ]],
		[[ MM    MM YM    d9 MM  MM YM.   ,M9 ]],
		[[_MM_  _MM_ YMMMM9 _MM__MM_ YMMMMM9  ]],
		[[                                    ]],
		[[                                    ]]
	},
	{
		[[         ___             ]],
		[[         `MM      6MMMb  ]],
		[[          MM     6M' `Mb ]],
		[[  _____   MM  __ `'   MM ]],
		[[ 6MMMMMb  MM 6MMb     MM ]],
		[[6M'   `Mb MMM9 `Mb   ,M9 ]],
		[[MM     MM MM'   MM  MM9  ]],
		[[MM     MM MM    MM  M    ]],
		[[MM     MM MM    MM       ]],
		[[YM.   ,M9 MM    MM 68b   ]],
		[[ YMMMMM9 _MM_  _MM_Y89   ]],
		[[                         ]],
		[[                         ]]
	},
	{
		[[   __              ___                  ]],
		[[  69MM             `MM                  ]],
		[[ 6M' `              MM                  ]],
		[[_MM____   ___   ____MM   __      ____   ]],
		[[MMMM`MM    MM  6MMMMMM  6MMbMMM 6MMMMb  ]],
		[[ MM  MM    MM 6M'  `MM 6M'`Mb  6M'  `Mb ]],
		[[ MM  MM    MM MM    MM MM  MM  MM    MM ]],
		[[ MM  MM    MM MM    MM YM.,M9  MMMMMMMM ]],
		[[ MM  MM    MM MM    MM  YMM9   MM       ]],
		[[ MM  YM.   MM YM.  ,MM (M      YM    d9 ]],
		[[_MM_  YMMM9MM_ YMMMMMM_ YMMMMb. YMMMM9  ]],
		[[                       6M    Yb         ]],
		[[                       YM.   d9         ]],
		[[                        YMMMM9          ]]
	},
    {
		[[                                  ___                  ]],
		[[                                  `MM                  ]],
		[[                                   MM                  ]],
		[[____    _    ___  _____  ___  __   MM   __ ____    ___ ]],
		[[`MM(   ,M.   )M' 6MMMMMb `MM 6MMb  MM   d' `MM(    )M' ]],
		[[ `Mb   dMb   d' 6M'   `Mb MMM9 `Mb MM  d'   `Mb    d'  ]],
		[[  YM. ,PYM. ,P  MM     MM MM'   MM MM d'     YM.  ,P   ]],
		[[  `Mb d'`Mb d'  MM     MM MM    MM MMdM.      MM  M    ]],
		[[   YM,P  YM,P   MM     MM MM    MM MMPYM.     `Mbd'    ]],
		[[   `MM'  `MM'   YM.   ,M9 MM    MM MM  YM.     YMP     ]],
		[[    YP    YP     YMMMMM9 _MM_  _MM_MM_  YM._    M      ]],
		[[                                               d'      ]],
		[[                                           (8),P       ]],
		[[                                            YMM        ]]
    },
    {
        [[         ___                                      ]],
        [[          MM                               6MMMb  ]],
        [[          MM                          /   6M' `Mb ]],
        [[   ___    MM____     _____  ___  __  /M   `'   MM ]],
        [[ 6MMMMb   MMMMMMb   6MMMMMb `MM 6MM /MMMMM     MM ]],
        [[8M'  `Mb  MM'  `Mb 6M'   `Mb MM69 "  MM       ,M9 ]],
        [[    ,oMM  MM    MM MM     MM MM'     MM      MM9  ]],
        [[,6MM9'MM  MM    MM MM     MM MM      MM      M    ]],
        [[MM'   MM  MM    MM MM     MM MM      MM           ]],
        [[MM.  ,MM  MM.  ,M9 YM.   ,M9 MM      YM.  , 68b   ]],
        [[`YMMM9'Yb_MYMMMM9   YMMMMM9 _MM_      YMMM9 Y89   ]],
        [[                                                  ]],
        [[                                                  ]]
    },
    {
        [[                                                 8  ]],
        [[                                                (M) ]],
        [[                                          /     (M) ]],
        [[  ____ ____    _    ___  ____     ____   /M     (M) ]],
        [[ 6MMMMb`MM(   ,M.   )M' 6MMMMb   6MMMMb /MMMMM   M  ]],
        [[MM'    ``Mb   dMb   d' 6M'  `Mb 6M'  `Mb MM      M  ]],
        [[YM.      YM. ,PYM. ,P  MM    MM MM    MM MM      M  ]],
        [[ YMMMMb  `Mb d'`Mb d'  MMMMMMMM MMMMMMMM MM      8  ]],
        [[     `Mb  YM,P  YM,P   MM       MM       MM         ]],
        [[L    ,MM  `MM'  `MM'   YM    d9 YM    d9 YM.  , 68b ]],
        [[MYMMMM9    YP    YP     YMMMM9   YMMMM9   YMMM9 Y89 ]],
        [[                                                    ]],
        [[                                                    ]]
    },
    {
        [[                               ]],
        [[         68b                   ]],
        [[         Y89                   ]],
        [[___  __  ___   ____     ____   ]],
        [[`MM 6MMb `MM  6MMMMb.  6MMMMb  ]],
        [[ MMM9 `Mb MM 6M'   Mb 6M'  `Mb ]],
        [[ MM'   MM MM MM    `' MM    MM ]],
        [[ MM    MM MM MM       MMMMMMMM ]],
        [[ MM    MM MM MM       MM       ]],
        [[ MM    MM MM YM.   d9 YM    d9 ]],
        [[_MM_  _MM_MM_ YMMMM9   YMMMM9  ]],
        [[                               ]],
        [[                               ]]
    },
    {
        [[                                            6MMMb  ]],
        [[                   /                       6M' `Mb ]],
        [[___  __   ____    /M     ___  __ ____    __`'   MM ]],
        [[`MM 6MM  6MMMMb  /MMMMM  `MM 6MM `MM(    )M'    MM ]],
        [[ MM69 " 6M'  `Mb  MM      MM69 "  `Mb    d'    ,M9 ]],
        [[ MM'    MM    MM  MM      MM'      YM.  ,P    MM9  ]],
        [[ MM     MMMMMMMM  MM      MM        MM  M     M    ]],
        [[ MM     MM        MM      MM        `Mbd'          ]],
        [[ MM     YM    d9  YM.  ,  MM         YMP     68b   ]],
        [[_MM_     YMMMM9    YMMM9 _MM_         M      Y89   ]],
        [[                                     d'            ]],
        [[                                 (8),P             ]],
        [[                                  YMM              ]]
    },
    {
        [[                      ___                       ___ ]],
        [[                      `MM 68b                   `MM ]],
        [[                       MM Y89                    MM ]],
        [[___  __    ___     ____MM ___   ____      ___    MM ]],
        [[`MM 6MM  6MMMMb   6MMMMMM `MM  6MMMMb.  6MMMMb   MM ]],
        [[ MM69 " 8M'  `Mb 6M'  `MM  MM 6M'   Mb 8M'  `Mb  MM ]],
        [[ MM'        ,oMM MM    MM  MM MM    `'     ,oMM  MM ]],
        [[ MM     ,6MM9'MM MM    MM  MM MM       ,6MM9'MM  MM ]],
        [[ MM     MM'   MM MM    MM  MM MM       MM'   MM  MM ]],
        [[ MM     MM.  ,MM YM.  ,MM  MM YM.   d9 MM.  ,MM  MM ]],
        [[_MM_    `YMMM9'Yb.YMMMMMM__MM_ YMMMM9  `YMMM9'Yb_MM_]],
        [[                                                    ]],
        [[                                                    ]]
    },
    {
        [[                                                                            ]],
        [[                                                                            ]],
        [[                                                                            ]],
        [[   ___  ____    _    ___  ____     ____     _____  ___  __    __     ____   ]],
        [[ 6MMMMb `MM(   ,M.   )M' 6MMMMb   6MMMMb\  6MMMMMb `MM 6MMb  6MMb   6MMMMb  ]],
        [[8M'  `Mb `Mb   dMb   d' 6M'  `Mb MM'    ` 6M'   `Mb MM69 `MM69 `Mb 6M'  `Mb ]],
        [[    ,oMM  YM. ,PYM. ,P  MM    MM YM.      MM     MM MM'   MM'   MM MM    MM ]],
        [[,6MM9'MM  `Mb d'`Mb d'  MMMMMMMM  YMMMMb  MM     MM MM    MM    MM MMMMMMMM ]],
        [[MM'   MM   YM,P  YM,P   MM            `Mb MM     MM MM    MM    MM MM       ]],
        [[MM.  ,MM   `MM'  `MM'   YM    d9 L    ,MM YM.   ,M9 MM    MM    MM YM    d9 ]],
        [[`YMMM9'Yb.  YP    YP     YMMMM9  MYMMMM9   YMMMMM9 _MM_  _MM_  _MM_ YMMMM9  ]],
        [[                                                                            ]],
        [[                                                                            ]]
    },
    {
        [[                                   ___             ]],
        [[                                   `MM             ]],
        [[                                    MM             ]],
        [[  __     ___  __      ___   ___  __ MM ____    ___ ]],
        [[ 6MMbMMM `MM 6MMb   6MMMMb  `MM 6MM MM `MM(    )M' ]],
        [[6M'`Mb    MMM9 `Mb 8M'  `Mb  MM69 " MM  `Mb    d'  ]],
        [[MM  MM    MM'   MM     ,oMM  MM'    MM   YM.  ,P   ]],
        [[YM.,M9    MM    MM ,6MM9'MM  MM     MM    MM  M    ]],
        [[ YMM9     MM    MM MM'   MM  MM     MM    `Mbd'    ]],
        [[(M        MM    MM MM.  ,MM  MM     MM     YMP     ]],
        [[ YMMMMb. _MM_  _MM_`YMMM9'Yb_MM_   _MM_     M      ]],
        [[6M    Yb                                   d'      ]],
        [[YM.   d9                               (8),P       ]],
        [[ YMMMM9                                 YMM        ]],
    },
    {
        [[   __                                                                    ]],
        [[  69MM                                                     68b           ]],
        [[ 6M' `                    /                          /     Y89           ]],
        [[_MM__   ___   ___  __    /M        ___      ____    /M     ___    ____   ]],
        [[MMMMM 6MMMMb  `MM 6MMb  /MMMMM   6MMMMb    6MMMMb\ /MMMMM  `MM   6MMMMb. ]],
        [[ MM  8M'  `Mb  MMM9 `Mb  MM     8M'  `Mb  MM'    `  MM      MM  6M'   Mb ]],
        [[ MM      ,oMM  MM'   MM  MM         ,oMM  YM.       MM      MM  MM    `' ]],
        [[ MM  ,6MM9'MM  MM    MM  MM     ,6MM9'MM   YMMMMb   MM      MM  MM       ]],
        [[ MM  MM'   MM  MM    MM  MM     MM'   MM       `Mb  MM      MM  MM       ]],
        [[ MM  MM.  ,MM  MM    MM  YM.  , MM.  ,MM  L    ,MM  YM.  ,  MM  YM.   d9 ]],
        [[_MM_ `YMMM9'Yb_MM_  _MM_  YMMM9 `YMMM9'Yb.MYMMMM9    YMMM9 _MM_  YMMMM9  ]],
        [[                                                                         ]],
        [[                                                                         ]]
    },
    {
        [[                                   ___ ___                          ]],
        [[                                   `MM `MM                          ]],
        [[                                    MM  MM                    /     ]],
        [[  ____  ____   ___  ____     ____   MM  MM   ____  ___  __   /M     ]],
        [[ 6MMMMb `MM(   )P' 6MMMMb.  6MMMMb  MM  MM  6MMMMb `MM 6MMb /MMMMM  ]],
        [[6M'  `Mb `MM` ,P  6M'   Mb 6M'  `Mb MM  MM 6M'  `Mb MMM9 `Mb MM     ]],
        [[MM    MM  `MM,P   MM    `' MM    MM MM  MM MM    MM MM'   MM MM     ]],
        [[MMMMMMMM   `MM.   MM       MMMMMMMM MM  MM MMMMMMMM MM    MM MM     ]],
        [[MM         d`MM.  MM       MM       MM  MM MM       MM    MM MM     ]],
        [[YM    d9  d' `MM. YM.   d9 YM    d9 MM  MM YM    d9 MM    MM YM.  , ]],
        [[ YMMMM9 _d_  _)MM_ YMMMM9   YMMMM9 _MM__MM_ YMMMM9 _MM_  _MM_ YMMM9 ]],
        [[                                                                    ]],
        [[                                                                    ]]
    },
    {
        [[                               ___ ___ ]],
        [[                               `MM `MM ]],
        [[                                MM  MM ]],
        [[  ____ ____    _    ___  ____   MM  MM ]],
        [[ 6MMMMb`MM(   ,M.   )M' 6MMMMb  MM  MM ]],
        [[MM'    ``Mb   dMb   d' 6M'  `Mb MM  MM ]],
        [[YM.      YM. ,PYM. ,P  MM    MM MM  MM ]],
        [[ YMMMMb  `Mb d'`Mb d'  MMMMMMMM MM  MM ]],
        [[     `Mb  YM,P  YM,P   MM       MM  MM ]],
        [[L    ,MM  `MM'  `MM'   YM    d9 MM  MM ]],
        [[MYMMMM9    YP    YP     YMMMM9 _MM__MM_]],
        [[                                       ]],
        [[                                       ]]
    },
    {
        [[___               ___ ___           ]],
        [[`MM               `MM `MM           ]],
        [[ MM                MM  MM           ]],
        [[ MM  __     ____   MM  MM    ___    ]],
        [[ MM 6MMb   6MMMMb  MM  MM  6MMMMb   ]],
        [[ MMM9 `Mb 6M'  `Mb MM  MM 8M'  `Mb  ]],
        [[ MM'   MM MM    MM MM  MM     ,oMM  ]],
        [[ MM    MM MMMMMMMM MM  MM ,6MM9'MM  ]],
        [[ MM    MM MM       MM  MM MM'   MM  ]],
        [[ MM    MM YM    d9 MM  MM MM.  ,MM  ]],
        [[_MM_  _MM_ YMMMM9 _MM__MM_`YMMM9'Yb.]],
        [[                                    ]],
        [[                                    ]]
    },
    {
        [[___                        ___                    ]],
        [[`MM                        `MM      68b           ]],
        [[ MM                         MM      Y89           ]],
        [[ MM  __     ____     ____   MM   __ ___ ___  __   ]],
        [[ MM 6MMb   6MMMMb   6MMMMb. MM   d' `MM `MM 6MMb  ]],
        [[ MMM9 `Mb 6M'  `Mb 6M'   Mb MM  d'   MM  MMM9 `Mb ]],
        [[ MM'   MM MM    MM MM    `' MM d'    MM  MM'   MM ]],
        [[ MM    MM MMMMMMMM MM       MMdM.    MM  MM    MM ]],
        [[ MM    MM MM       MM       MMPYM.   MM  MM    MM ]],
        [[ MM    MM YM    d9 YM.   d9 MM  YM.  MM  MM    MM ]],
        [[_MM_  _MM_ YMMMM9   YMMMM9 _MM_  YM._MM__MM_  _MM_]],
        [[                                                  ]],
        [[                                                  ]]
    },
    {
        [[                                                        ]],
        [[68b                                                     ]],
        [[Y89            /                                        ]],
        [[___ ___  __   /M      ____  ___  __     ____     ____   ]],
        [[`MM `MM 6MMb /MMMMM  6MMMMb `MM 6MMb   6MMMMb\  6MMMMb  ]],
        [[ MM  MMM9 `Mb MM    6M'  `Mb MMM9 `Mb MM'    ` 6M'  `Mb ]],
        [[ MM  MM'   MM MM    MM    MM MM'   MM YM.      MM    MM ]],
        [[ MM  MM    MM MM    MMMMMMMM MM    MM  YMMMMb  MMMMMMMM ]],
        [[ MM  MM    MM MM    MM       MM    MM      `Mb MM       ]],
        [[ MM  MM    MM YM.  ,YM    d9 MM    MM L    ,MM YM    d9 ]],
        [[_MM__MM_  _MM_ YMMM9 YMMMM9 _MM_  _MM_MYMMMM9   YMMMM9  ]],
        [[                                                        ]],
        [[                                                        ]]
    },
    {
        [[                ___                           8  ]],
        [[                `MM                          (M) ]],
        [[                 MM                          (M) ]],
        [[____    _    ___ MM  __     _____      ___   (M) ]],
        [[`MM(   ,M.   )M' MM 6MMb   6MMMMMb   6MMMMb   M  ]],
        [[ `Mb   dMb   d'  MMM9 `Mb 6M'   `Mb 8M'  `Mb  M  ]],
        [[  YM. ,PYM. ,P   MM'   MM MM     MM     ,oMM  M  ]],
        [[  `Mb d'`Mb d'   MM    MM MM     MM ,6MM9'MM  8  ]],
        [[   YM,P  YM,P    MM    MM MM     MM MM'   MM     ]],
        [[   `MM'  `MM'    MM    MM YM.   ,M9 MM.  ,MM 68b ]],
        [[    YP    YP    _MM_  _MM_ YMMMMM9  `YMMM9'YbY89 ]],
        [[                                                 ]],
        [[                                                 ]]
    }
}

-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
-- [[     ]],
local footerOptions = {
    {
        [[     ]],
        [[Decent, inoffensive.]]
    },
    {
        [[     ]],
        [[Would recommend.]]
    },
    {
        [[     ]],
        [[Decidedly average]]
    },
    {
        [[     ]],
        [[Literally unplayable.]]
    },
    {
        [[     ]],
        [[Meh.]]
    },
    {
        [[     ]],
        [[Do not recommend.]]
    },
    {
        [[     ]],
        [[It's okay, I guess.]]
    },
    {
        [[     ]],
        [[Totes McGoats]]
    },
    {
        [[     ]],
        [[Best 5ever.]]
    },
}

local function getRandom(num)
    math.randomseed(os.time())
    return math.random(num)
end

local function getHeader()
    return headerOptions[getRandom(#headerOptions)]
end

local function getFooter()
    return footerOptions[getRandom(#footerOptions)]
end

db.custom_header = getHeader()
db.custom_footer = getFooter()
db.custom_center = {
    {
        icon = '  ',
        desc = 'Recent Files                            ',
        action =  'Telescope oldfiles',
        shortcut = 'SPC f r'
    },
    {
        icon = '  ',
        desc = 'Find File                               ',
        action = 'Telescope find_files find_command=rg,--hidden,--files,-S',
        shortcut = 'SPC f f'
    },
    {
        icon = '  ',
        desc = 'New File                                ',
        action = 'DashboardNewFile',
        shortcut = 'SPC f n'
    },
    {
        icon = 'פּ  ',
        desc ='File Browser                            ',
        action =  'Telescope file_browser',
        shortcut = 'SPC f p'
    },
    {
        icon = '  ',
        desc ='Search Text                             ',
        action =  'Telescope live_grep',
        shortcut = 'SPC s t'
    },
}
