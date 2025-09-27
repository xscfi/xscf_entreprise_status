Config = {}

-- Cooldown en secondes
Config.Cooldown = 60

Config.Entreprises = {
    burgershot = {
        label = "BurgerShot",
        icon = "🍔",
        jobs = { "burgershot" },
        duration = 7000,
        position = 1, -- 0 = haut gauche, 1 = bas droite, 2 = centre
        minGrade = 2 -- grade minimal requis (0 = recrue, 1 = employé, 2 = manager, 3 = boss, etc.)
    },
    police = {
        label = "LSPD",
        icon = "Le",
        jobs = { "police" },
        duration = 10000,
        position = 2,
        minGrade = 3
    }
}
