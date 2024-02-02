if SERVER then
   AddCSLuaFile()
end

SWEP.PrintName = "My Custom Weapon"
SWEP.Author = "Your Name"
SWEP.Contact = "Your Contact Info"
SWEP.Purpose = "Description of the weapon"
SWEP.Instructions = "Instructions for using the weapon"
SWEP.Category = "Custom Weapons"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 9999
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Delay = 0.1
SWEP.Primary.Recoil = 1
SWEP.Primary.Cone = 0.02

function SWEP:Initialize()
   self:SetHoldType("pistol")
end

function SWEP:PrimaryAttack()
   if not self:CanPrimaryAttack() then return end

   self:EmitSound("Weapon_Pistol.Single")
   self:ShootBullet(self.Primary.Damage, 1, self.Primary.Cone)

   self:TakePrimaryAmmo(1)

   self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
end

function SWEP:SecondaryAttack()
   -- Add secondary attack logic if needed
end
