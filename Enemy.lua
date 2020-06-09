Enemy = {}

function Enemy:new(nom,i,x, y, w, h,hpm)
  local obj = {
    nome = nom,
    imagem = i,
    px = x,
    py = y,
    width = w,
    height = h,
    collided = false,
    HP = hpm,
    HPT = hpm,
    nocaute = false,
    turno = false
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Enemy:GetHPT()
  return self.HPT
end
function Enemy:IsTurno()
  return self.turno
end
function Enemy:SetTurno(h)
  self.turno = h
end
function Enemy:IsNocaute()
  return self.nocaute
end
function Enemy:SetNocaute(h)
  self.nocaute = h
end
function Enemy:SetX(x)
  self.px = x
end
function Enemy:SetY(y)
  self.py = y
end
function Enemy:GetX()
  return self.px
end
function Enemy:GetY()
  return self.py
end
function Enemy:GetWidth()
  return self.width
end
function Enemy:GetHeight()
  return self.height
end
function Enemy:IsCollided()
  return self.collided
end
function Enemy:SetCollided(c)
  self.collided = c
end
function Enemy:GetImagem()
  return self.imagem
end
function Enemy:GetHP()
  return self.HP
end
function Enemy:SetHP(h)
  self.HP = h
end