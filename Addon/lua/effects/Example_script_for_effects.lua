EFFECT.Mat = Material("sprites/glow04_noz")
EFFECT.LifeTime = 1.0
EFFECT.Size = 64

function EFFECT:Init(data)
    self.Position = data:GetOrigin()
    self.WeaponEnt = data:GetEntity()
    self.Attachment = data:GetAttachment()

    self.StartTime = CurTime()

    local pos, ang = self:GetTracerOrigin()

    local emitter = ParticleEmitter(pos)
    local particle = emitter:Add(self.Mat, pos)

    if particle then
        particle:SetDieTime(self.LifeTime)
        particle:SetStartAlpha(255)
        particle:SetEndAlpha(0)
        particle:SetStartSize(self.Size)
        particle:SetEndSize(0)
        particle:SetAngles(ang)
        particle:SetAngleVelocity(Vector(0, 0, 0))
        particle:SetColor(255, 255, 255)
        particle:SetGravity(Vector(0, 0, 0))
        particle:SetAirResistance(0)
        particle:SetCollide(false)
    end

    emitter:Finish()
end

function EFFECT:Think()
    return CurTime() - self.StartTime < self.LifeTime
end

function EFFECT:Render()
    -- Do nothing here
end
