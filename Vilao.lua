Vilao = {}

function Vilao:new(i,x, y, w, h)
  local obj = {
    imagem = i,
    px = x,
    py = y,
    width = w,
    height = h,
    collided = false
  }
  setmetatable(obj, self)
  self.__index = self
  return obj
end
function Vilao:MoveX(x)
  self.px = self.px + x
end
function Vilao:MoveY(y)
  self.py = self.py + y
end
function Vilao:GetX()
  return self.px
end
function Vilao:GetY()
  return self.py
end
function Vilao:GetWidth()
  return self.width
end
function Vilao:GetHeight()
  return self.height
end
function Vilao:IsCollided()
  return self.collided
end
function Vilao:SetCollided(c)
  self.collided = c
end
function Vilao:GetImagem()
  return self.imagem
end