return {
    backgroundMusic = ripple.newSound(
        {
            source = love.audio.newSource("asset/frozen_over.wav", "static")
        }
    ),
    pushBlock = love.audio.newSource("asset/placing3.wav", "stream"),
    goalReached = ripple.newSound(
        {
            source = love.audio.newSource("asset/cannonShoot.wav", "static")
        }
    ),
    snowStep = ripple.newSound(
        {
            source = love.audio.newSource("asset/snowStep.wav", "static")
        }
    ),
    iceStep = ripple.newSound(
        {
            source = love.audio.newSource("asset/iceStep.wav", "static")
        }
    ),
    buttonPress = ripple.newSound(
        {
            source = love.audio.newSource("asset/buttonPress.wav", "static")
        }
    )
}
