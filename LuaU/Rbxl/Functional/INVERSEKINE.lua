
local Source = [==[

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = Workspace.CurrentCamera
Camera:ClearAllChildren()

--local Limbs = {}

local _Width = 0.8
local _TorsoWidth = _Width*1.1
local _TorsoBottomPercent = 0.85
local _Distance = 1
local _FootLength = _Width*1.5
local _FootWidth = _Width*1--.25
local _TorsoWidth2 = 1.8

local RunService = game:GetService("RunService")
local RenderStepped = RunService.RenderStepped
local sqrt = math.sqrt
local Vector2New = Vector2.new
local Vector3New = Vector3.new
local UDim2New = UDim2.new
local VecNew = Vector3New
local CFrameNew = CFrame.new
local CFrameLerp = CFrame.new(0,0,0).lerp
local FindPartOnRay = Workspace.FindPartOnRayWithIgnoreList
local inverse = CFrameNew(0,0,0).inverse
local InstanceNew = Instance.new
local BrickColorNew = BrickColor.new
local RayNew = Ray.new
local deg = math.deg
local rad = math.rad
local cos = math.cos
local sin = math.sin
local abs = math.abs
local acos = math.acos
local pi = math.pi
local pi2 = pi/2
local npi2 = -pi2
local Cross = Vector3New(0,0,0).Cross
local Dot = Vector3New(0,0,0).Dot
local Angles = CFrame.Angles
local CFrameAngles = Angles
local toEulerAnglesXYZ = CFrameNew(0,0,0).toEulerAnglesXYZ
local Ang1 = CFrameAngles(pi,0,pi2)
local Ang2 = CFrameAngles(pi,pi,npi2)

function NewLimb(Part,Distance)
	local Tab = {}
	Tab.Points = {}
	Tab.Links = {}
	Tab.Distance = Distance
	Tab.Part = Part
	Tab.Parts = {{},{},{},{}}
	Limbs[#Limbs+1] = Tab
	return Tab
end

function NewPoint(Points,X,Y,Z,Anchored,Color)
	Gravity = Gravity or 0
	Color = Color or BrickColor.new("Medium stone grey")
	local Tab = {X=X,Y=Y,Z=Z,Anchored=Anchored,Color=Color}
	Points[#Points+1] = Tab
	return Tab
end

function NewLink(Links,P1,P2,Dis)
	local Tab = {Point1=P1,Point2=P2}
	Links[#Links+1] = Tab
	return Tab
end

local function CFrameFromTopBack(at, top, back)
    local right = Cross(top,back)
    return CFrameNew(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function look(cf, lPoint)
	--[[local lookDiff = (lPoint - cf.p).unit
	local cross = cf.lookVector:Cross(lookDiff)
	
	local d = cf.lookVector:Dot(lookDiff)
	local s = (2 * (d + 1)) ^ 0.5
	local mag = 1 / s
	
	local x = mag * cross.x
	local y = mag * cross.y
	local z = mag * cross.z
	local w = 0.5 * s
	
	return cf*CFrame.new(0, 0, 0, x, y, z, w)]]
	local A,B = cf.p,lPoint
	local Rel;
	--if abs((B-A).unit.Y) >= 0.6 then
		local Rel = CFrame.new(A)*CFrameAngles(-pi/2,0,0)
		A = Rel:inverse()*A
		B = Rel:inverse()*B
		return Rel*CFrameNew(A,B)
	--[[else
		return CFrameNew(A,B)
	end]]
end

local ClothingPositions = {
	Torso = {
		Front = {Vector2.new(231,74),Vector2.new(128,128)},
		Right = {Vector2.new(165,74),Vector2.new(60,128)},
		Left = {Vector2.new(363,74),Vector2.new(60,128)},
		Back = {Vector2.new(427,74),Vector2.new(128,128)},
		Top = {Vector2.new(231,9),Vector2.new(128,60),-90},
		Bottom = {Vector2.new(231,207),Vector2.new(128,60),90}
	},
	Left = {
		Front = {Vector2.new(308,355),Vector2.new(60,128)},
		Left = {Vector2.new(374,355),Vector2.new(60,128)},
		Back = {Vector2.new(440,355),Vector2.new(60,128)},
		Right = {Vector2.new(506,355),Vector2.new(60,128)},
		Top = {Vector2.new(308,289),Vector2.new(60,60),-90},
		Bottom = {Vector2.new(308,487),Vector2.new(60,60),90}
	},
	Right = {
		Front = {Vector2.new(218,355),Vector2.new(60,128)},
		Right = {Vector2.new(152,355),Vector2.new(60,128)},
		Back = {Vector2.new(86,355),Vector2.new(60,128)},
		Left = {Vector2.new(20,355),Vector2.new(60,128)},
		Top = {Vector2.new(218,289),Vector2.new(60,60),-90},
		Bottom = {Vector2.new(218,487),Vector2.new(60,60),90}
	}
}

local function CreateTriangle(parent, a, b, c, parts, color)
    local mPart1 = parts and parts[1] or nil
	local Mesh1;
	local YEP = true
	if mPart1 == nil then
		YEP = false
		mPart1 = InstanceNew('WedgePart',parent)
		mPart1.Anchored = true
		mPart1.Name = "Triangle"
		mPart1.CanCollide = false
		mPart1.BrickColor = color
		mPart1.Material = "SmoothPlastic"
		mPart1.TopSurface = 'SmoothNoOutlines'
		mPart1.BottomSurface = 'SmoothNoOutlines'
		mPart1.FrontSurface = 'SmoothNoOutlines'
		mPart1.BackSurface = 'SmoothNoOutlines'
		mPart1.LeftSurface = 'SmoothNoOutlines'
		mPart1.RightSurface = 'SmoothNoOutlines'
		mPart1.Size = VecNew(1,1,1)
		Mesh1 = InstanceNew("SpecialMesh",mPart1)
		Mesh1.Name = "Mesh"
		Mesh1.MeshType = "Wedge"
		parts[1] = mPart1
	else
		--tablerem(parts,1)
		Mesh1 = mPart1.Mesh
	end
	local mPart2 = parts and parts[2] or nil
	local Mesh2;
	if mPart2 == nil then
		mPart2 = InstanceNew('WedgePart',parent)
		mPart2.Name = "Triangle"
		mPart2.Anchored = true
		mPart2.CanCollide = false
		mPart2.BrickColor = color
		mPart2.Material = "SmoothPlastic"
		mPart2.TopSurface = 'SmoothNoOutlines'
		mPart2.BottomSurface = 'SmoothNoOutlines'
		mPart2.FrontSurface = 'SmoothNoOutlines'
		mPart2.BackSurface = 'SmoothNoOutlines'
		mPart2.LeftSurface = 'SmoothNoOutlines'
		mPart2.RightSurface = 'SmoothNoOutlines'
		mPart2.Size = VecNew(1,1,1)
		Mesh2 = InstanceNew("SpecialMesh",mPart2)
		Mesh2.Name = "Mesh"
		Mesh2.MeshType = "Wedge"
		parts[2] = mPart2
	else
		--tablerem(parts,1)
		Mesh2 = mPart2.Mesh
	end
	local ab, bc, ca = b-a, c-b, a-c local abm, bcm, cam = ab.magnitude, bc.magnitude, ca.magnitude
	local edg1 = abs(0.5 + Dot(ca,ab)/(abm*abm))
	local edg2 = abs(0.5 + Dot(ab,bc)/(bcm*bcm))
	local edg3 = abs(0.5 + Dot(bc,ca)/(cam*cam))
	if edg1 < edg2 then
		if edg1 < edg3 then
			-- nothing to change
		else
			a, b, c = c, a, b
			ab, bc, ca = ca, ab, bc
			abm = cam
		end
	else
		if edg2 < edg3 then
			a, b, c = b, c, a
			ab, bc, ca = bc, ca, ab
			abm = bcm
		else 
			a, b, c = c, a, b
			ab, bc, ca = ca, ab, bc
			abm = cam
		end
	end

	local len1 = -Dot(ca,ab)/abm local len2 = abm - len1 local width = (ca + ab.unit*len1).magnitude
	local maincf = CFrameFromTopBack(a, Cross(ab,bc).unit, -ab.unit)
	local width2 = width/2
	
	--[[if not YEP then]] mPart1.CFrame = maincf*Ang1*CFrameNew(0,width2,len1/2) --end
	Mesh1.Scale = VecNew(0.001, width, len1)

	--[[if not YEP then]] mPart2.CFrame = maincf*Ang2*CFrameNew(0,width2,-len1 - len2/2) --end
	Mesh2.Scale = VecNew(0.001, width, len2)
    --return mPart1,mPart2,(YEP and maincf*CFrameAngles(pi,0,pi2)*CFrameNew(0,Width2,len1/2) or nil),(YEP and maincf*CFrameAngles(pi,pi,npi2)*CFrameNew(0,Width2,-len1 - len2/2) or nil)
end


function Render(Torso,Data,Model,Scale,Width,Distance)
	local Limbs = Data.Limbs
	local TorsoCFr = Torso:GetRenderCFrame()
	for i = 1,#Limbs do
		local L = i
		local Limb1 = Limbs[i]
		local Parts = Limb1.Parts
		local Links = Limb1.Links
		local Limb = Limb1.Part
		local Ang = Limb1.Ang
		local Color = Limb.BrickColor
		local Part = Parts[1][1]
		if Part == nil then
			Part = Instance.new("Part",Model)
			Part.Locked = true
			Part.Material = "SmoothPlastic"
			Part.TopSurface = 'SmoothNoOutlines'
			Part.BottomSurface = 'SmoothNoOutlines'
			Part.FrontSurface = 'SmoothNoOutlines'
			Part.BackSurface = 'SmoothNoOutlines'
			Part.LeftSurface = 'SmoothNoOutlines'
			Part.RightSurface = 'SmoothNoOutlines'
			Part.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
			Part.Size = Vector3New(Width,Distance,Width)
			Part.Anchored = true
			Part.BrickColor = Limb.BrickColor
			Part.CanCollide = false
			Part:BreakJoints()
			Parts[1][1] = Part
			local Mesh = InstanceNew("BlockMesh",Part)
			Mesh.Scale = Vector3New(Width,Distance,Width)/Part.Size
		end
		if Part.Size.X ~= Width then
			Part.Size = Vector3New(Width,Distance,Width)
			Part.Mesh.Scale = Vector3New(Width,Distance,Width)/Part.Size
		end
		Part.BrickColor = Color
		Part.CFrame = TorsoCFr*(Limb1.CF1*CFrameNew(0,0,Distance/2))*CFrameAngles(rad(90),0,0)*CFrameAngles(0,pi,0)
		Part:BreakJoints()

		local Ang = pi-Limb1.Ang*2

		local Part = Parts[1][2]
		if Part == nil then
			Part = Instance.new("Part",Model)
			Part.Locked = true
			Part.Material = "SmoothPlastic"
			Part.TopSurface = 'SmoothNoOutlines'
			Part.BottomSurface = 'SmoothNoOutlines'
			Part.FrontSurface = 'SmoothNoOutlines'
			Part.BackSurface = 'SmoothNoOutlines'
			Part.LeftSurface = 'SmoothNoOutlines'
			Part.RightSurface = 'SmoothNoOutlines'
			local Desired = Vector3New(Width-0.0001,Distance,Width)
			Part.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
			Part.Size = Desired
			Part.Anchored = true
			Part.BrickColor = Limb.BrickColor
			Part.CanCollide = false
			Part:BreakJoints()
			Parts[1][2] = Part
			local Mesh = InstanceNew("BlockMesh",Part)
			Mesh.Scale = Desired/Part.Size
		end
		if Part.Size.X ~= Width then
			local Desired = Vector3New(Width-0.0001,Distance,Width)
			Part.Size = Desired
			Part.Mesh.Scale = Desired/Part.Size
		end
		Part.BrickColor = Color
		local LegCFr = TorsoCFr*(Limb1.CF1*CFrameAngles(Ang,0,0)*CFrameNew(0,0,Distance/2))*CFrameAngles(rad(-90),0,0)*CFrameAngles(0,pi,0)
		Part.CFrame = LegCFr
		Part:BreakJoints()

		local Part = Parts[1][3]
		if Part == nil then
			Part = Instance.new("Part",Model)
			Part.Locked = true
			Part.Material = "SmoothPlastic"
			Part.TopSurface = 'SmoothNoOutlines'
			Part.BottomSurface = 'SmoothNoOutlines'
			Part.FrontSurface = 'SmoothNoOutlines'
			Part.BackSurface = 'SmoothNoOutlines'
			Part.LeftSurface = 'SmoothNoOutlines'
			Part.RightSurface = 'SmoothNoOutlines'
			Part.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
			Part.Size = Vector3New(1,1,1)
			Part.Anchored = true
			Part.BrickColor = Limb.BrickColor
			Part.CanCollide = false
			Part:BreakJoints()
			Parts[1][3] = Part
			--[[local Mesh = InstanceNew("SpecialMesh",Part)
			Mesh.MeshType = "Cylinder"]]
			local Mesh = InstanceNew("BlockMesh",Part)
		end
		Part.BrickColor = Color
		if i == 1 or i == 4 then
			Ang = -Ang
		end
		local a = Width/2
		a = a*a
		local Size = (2*a-2*a*cos(Ang))^0.5
		local Size2 = Size/2
		local Height = (a-Size2*Size2)^0.5
		local Height2 = Height*2
		local Desired = Vector3New(Width-0.0002,Height2,Size/2)
		Part.Size = Desired
		if Part.Size ~= Desired then
			Part.Mesh.Scale = Desired/Part.Size
		else
			Part.Mesh.Scale = Vector3New(1,1,1)
		end
		Limb1.GapPercent = Height2/(Distance*2)
		Limb1.MinimumPercent = Height2/0.2
		Part.CFrame = TorsoCFr*(Limb1.CF1*CFrameAngles(Ang/2*((i==1 or i==4) and -1 or 1),0,0))*CFrame.Angles(0,pi,0)*CFrame.new(0,0,(i==1 or i==4) and Size/4 or -Size/4)
		Part:BreakJoints()
		--[[Part.CFrame = TorsoCFr*(Limb1.CF1)--*CFrame.new(0,-0.002*Scale,0)
		Part.Mesh.Scale = Vector3New(Width-0.0002,Width,Width)]]

		--[[local Part = Parts[1][5]
		if Part == nil then
			Part = Instance.new("Part",Model)
			Part.Locked = true
			Part.Material = "SmoothPlastic"
			Part.TopSurface = 'SmoothNoOutlines'
			Part.BottomSurface = 'SmoothNoOutlines'
			Part.FrontSurface = 'SmoothNoOutlines'
			Part.BackSurface = 'SmoothNoOutlines'
			Part.LeftSurface = 'SmoothNoOutlines'
			Part.RightSurface = 'SmoothNoOutlines'
			Part.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
			Part.Size = Vector3New(1,1,1)
			Part.Anchored = true
			Part.BrickColor = Limb.BrickColor
			Part.CanCollide = false
			Part:BreakJoints()
			Parts[1][5] = Part
			local Mesh = InstanceNew("SpecialMesh",Part)
			Mesh.MeshType = "Cylinder"
		end
		Part.BrickColor = Color
		Part.CFrame = TorsoCFr*(Limb1.CF1*CFrameAngles(Ang,0,0))
		Part:BreakJoints()
		Part.Mesh.Scale = Vector3New(Width-0.0002,Width,Width)]]

		--[[if i == 2 or i == 3 then
			local Part = Parts[1][4]
			if Part == nil then
				Part = Instance.new("Part",Model)
				Part.Locked = true
				Part.Material = "SmoothPlastic"
				Part.TopSurface = 'SmoothNoOutlines'
				Part.BottomSurface = 'SmoothNoOutlines'
				Part.FrontSurface = 'SmoothNoOutlines'
				Part.BackSurface = 'SmoothNoOutlines'
				Part.LeftSurface = 'SmoothNoOutlines'
				Part.RightSurface = 'SmoothNoOutlines'
				Part.Name = "Foot"
				Part.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
				Part.Size = Vector3New(_FootWidth*Scale,Distance*0.3,_FootLength*Scale)
				Part.Anchored = true
				Part.BrickColor = Limb.BrickColor
				Part.CanCollide = false
				Part:BreakJoints()
				Parts[1][4] = Part
				local Mesh = InstanceNew("BlockMesh",Part)
				Mesh.Scale = Vector3New(_FootWidth*Scale,Distance*0.3,_FootLength*Scale)/Part.Size
			end
			if Part.Size.X ~= _FootWidth*Scale then
				Part.Size = Vector3New(_FootWidth*Scale,Distance*0.3,_FootLength*Scale)
				Part.Mesh.Scale = Vector3New(_FootWidth*Scale,Distance*0.3,_FootLength*Scale)/Part.Size
			end
			Part.BrickColor = Color
			local Leg = LegCFr*CFrameNew(0,-Distance*0.5,0)
			local CFr = Limb1.FootAng
			local Z1 = (Leg*CFr*CFrameNew(0,0,_FootLength*Scale/2))
			local Z2 = Z1:inverse()*(Leg*CFrameNew(0,0,Width/2))
			local Z3 = Z1:inverse()*(Leg*CFrameNew(0,Distance*0.3,Width/2))
			local Z = math.min(Z2.Z,Z3.Z)
			Part.CFrame = Leg*CFr*CFrameNew(0,Distance*0.15,Z)
			Part:BreakJoints()
		end]]
	end
end

local C0s = {}

C0s[1] = CFrame.new(_TorsoWidth2/2,0.8,0)
C0s[2] = CFrame.new(0.5,-1,0)
C0s[3] = CFrame.new(-0.5,-1,0)
C0s[4] = CFrame.new(-_TorsoWidth2/2,0.8,0)

local C1s = {}

C1s[1] = CFrame.new(-_Width/2,-0.2,0)
C1s[2] = CFrame.new(0,0,0)
C1s[3] = CFrame.new(0,0,0)
C1s[4] = CFrame.new(_Width/2,-0.2,0)

local WorldUp = Vector3.new(0,1,0)
function look2(Vec1,Vec2)
    local Orig = Vec1
    Vec1 = Vec1+Vector3.new(0,1,0)
    Vec2 = Vec2+Vector3.new(0,1,0)
    local Forward = (Vec2-Vec1).unit
    local Up = (WorldUp-WorldUp:Dot(Forward)*Forward).unit
    local Right = Up:Cross(Forward).unit
    Forward = -Forward
    Right = -Right
    return CFrame.new(Orig.X,Orig.Y,Orig.Z,Right.X,Up.X,Forward.X,Right.Y,Up.Y,Forward.Y,Right.Z,Up.Z,Forward.Z)
end

function look(CFr,Vec2)
    local A = Vector3.new(0,0,0)
    local B = CFr:inverse()*Vec2
    local CF = look2(A,Vector3.new(A.X,B.Y,B.Z))
    if B.Z > 0 then
        CF = CFr*(CF*CFrame.Angles(0,0,math.pi))
    elseif B.Z == 0 then
        if B.Y > 0 then
            CF = CFr*CFrame.Angles(math.pi/2,0,0)
        elseif B.Y < 0 then
            CF = CFr*CFrame.Angles(-math.pi/2,0,0)
        else
            CF = CFr
        end
    end
    local _,_,_,_,X,_,_,Y,_,_,Z,_ = CF:components()
    local Up = Vector3.new(X,Y,Z)
    local Forward = (Vec2-CFr.p).unit
    local Right = Up:Cross(Forward)
    Forward = -Forward
    Right = -Right
    return CFrame.new(CFr.X,CFr.Y,CFr.Z,Right.X,Up.X,Forward.X,Right.Y,Up.Y,Forward.Y,Right.Z,Up.Z,Forward.Z)
end

function IK(Torso,Data,Model,Scale,Width,Distance)
	local TorsoCFr = Torso.CFrame
	local Limbs = Data.Limbs
	for l = 1,#Limbs do
		local Limb = Limbs[l]
		--[[local Orig = Limb.Orig
		if Orig == nil then
			local Point = Limb.Points[1]
			Limb.Orig = CFrame.new(Point.X,Point.Y,Point.Z)
			Orig = Limb.Orig
		end]]
		local C0 = CFrameNew(C0s[l].p*Scale)
		local C1 = CFrameNew(C1s[l].p*Scale)
		local Points = Limb.Points
		local cf = C0*C1:inverse()
		local p1 = Points[1]
		p1.X = cf.X
		p1.Y = cf.Y
		p1.Z = cf.Z
		--local Distance = Limb.Distance
		if l == 1 or l == 4 then -- Arms
			local CFr = inverse(TorsoCFr)*(Limb.Part.CFrame*CFrameNew(0,-Limb.Part.Size.Y/2,0))
			local P = Points[3]
			P.X = CFr.X
			P.Y = CFr.Y
			P.Z = CFr.Z
		elseif l == 2 or l == 3 then -- Legs
			local CFr = inverse(TorsoCFr)*(Limb.Part.CFrame*CFrameNew(0,-Limb.Part.Size.Y/2,0))
			local P = Points[3]
			P.X = CFr.X
			P.Y = CFr.Y
			P.Z = CFr.Z
			local Vec = TorsoCFr*Vector3New(Points[1].X,Points[1].Y,Points[1].Z)
			local Vec2 = TorsoCFr*CFr.p
			local Ray = RayNew(Vec,(Vec2-Vec).unit*((Vec2-Vec).magnitude))
			local _,Pos = FindPartOnRay(Workspace,Ray,{Torso.Parent,Camera})
			if (Vec-Pos).Magnitude < 0.1 then
				Pos = Vec+((Vec2-Vec).unit*0.1)
			end
			local New = (inverse(TorsoCFr)*Pos)
			P.X = New.X
			P.Y = New.Y
			P.Z = New.Z
			if l == 2 then
				Level1 = Points[3].Y
			else
				Level2 = Points[3].Y
			end
		end
		local Point1 = Points[1]
		local Point2 = Points[2]
		local Point3 = Points[3]
		local Vec1 = Vector3New(Point1.X,Point1.Y,Point1.Z)
		local Vec3 = Vector3New(Point3.X,Point3.Y,Point3.Z)
		--[[if (Vec1-Vec3).magnitude > (Distance*2-0.001) then
			local CF = CFrameNew(Vec1,Vec3)*CFrameNew(0,0,-Distance*2+0.001)
			Point3.X = CF.X
			Point3.Y = CF.Y
			Point3.Z = CF.Z
			Vec3 = Vector3New(Point3.X,Point3.Y,Point3.Z)
		end]]
		local LimbCFr = inverse(TorsoCFr)*(Limb.Part.CFrame*CFrame.Angles(math.rad(90),0,0))
		--local LimbCFr = look(CFrameNew(Vec1),Vec3)*CFrame.new(0,0,-Limb.Part.Size.Y/2)*CFrame.Angles(pi,pi,0)
		local Inv = inverse(LimbCFr)
		local CFr = CFrameNew(Inv*Vec1,Inv*Vec3) --Inv*LimbCFr
		local CF = LimbCFr*CFr
		local CF = (C0*(CF-CF.p))*CFrameAngles(rad(-90),0,0)*C1*CFrameAngles(rad(90),0,0)
		Vec1 = CF.p
		if (Vec1-Vec3).magnitude > (Distance*2-0.001) then
			local CF = CFrameNew(Vec1,Vec3)*CFrameNew(0,0,-Distance*2+0.001)
			Point3.X = CF.X
			Point3.Y = CF.Y
			Point3.Z = CF.Z
			Vec3 = Vector3New(Point3.X,Point3.Y,Point3.Z)
		end
		Vec1 = Inv*Vec1
		Vec3 = Inv*Vec3
		CFr = CFrameNew(Vec1,Vec3)
		Vec1 = Vector2New(0,0)
		local v = inverse(CFr)*Vec3
		local Vec2 = Vector2New(0,v.Z)
		local A,B,C = Distance,Distance,(Vec1-Vec2).magnitude
		local Ang = acos((A*A-B*B-C*C)/(-2*B*C))
		if l == 2 or l == 3 then Ang = -Ang end
		Limb.Ang = Ang
		Limb.CF1 = LimbCFr*(CFr*CFrameAngles(Ang,0,0)*CFrame.new(0,0,-Distance))
		--[[local Dir = (Vec1-Vec2).unit
		Dir = Vector2New(Dir.X*cos(Ang)-Dir.Y*sin(Ang),Dir.X*sin(Ang)+Dir.Y*cos(Ang))*Distance
		local Vec3 = Vec2+Dir
		Vec3 = Vector3New(0,Vec3.X,Vec3.Y)
		local Pos = CFr*Vec3
		Pos = LimbCFr*Pos
		Point2.X = Pos.X
		Point2.Y = Pos.Y
		Point2.Z = Pos.Z
		local Ang = pi-Ang*2
		if l == 2 or l == 3 then
			local CFr = (Limb.CF1*CFrameAngles(Ang,0,0)*CFrameNew(0,0,Distance/2))*CFrameAngles(rad(-90),0,0)*CFrameNew(0,-Distance*0.475,0)*CFrameAngles(0,pi,0)
			local start1 = (TorsoCFr*CFr)
			local start2 = (TorsoCFr*CFr)
			local end1 = (TorsoCFr*(CFr*CFrameNew(0,-Distance*0.1,0))).p
			local end2 = (TorsoCFr*(CFr*CFrameNew(0,-Distance*0.25,-_FootLength*Scale+Width/2))).p
			CFr = TorsoCFr*CFr
			local ray = RayNew(start1.p,(end1-start1.p))
			local part,pos,normal = FindPartOnRay(Workspace,ray,{Torso.Parent,Camera})
			local ray2 = RayNew(start2.p,(end2-start2.p))
			local part2,pos2,normal2 = FindPartOnRay(Workspace,ray2,{Torso.Parent,Camera})
			if pos and pos2 and part and part2 then
				local forward = (pos2 - pos).unit
				local up = normal
				local right = Cross(forward,up)
				local CF = inverse(CFr)*(CFrameNew(pos) * CFrameNew(0, 0, 0,
					right.x, up.x, -forward.x,
					right.y, up.y, -forward.y,
					right.z, up.z, -forward.z)--[[*CFrameNew(0,0.1,0)] ])
				--[[if Limb.FootAng then
					Limb.FootAng = CFrameLerp(Limb.FootAng,CF,0.25)
				else] ]
					Limb.FootAng = CF
				--end
			else
				local pos = inverse(CFr)*pos
				local pos2 = inverse(CFr)*pos2
				local Point = look(CFrameNew(pos),pos2)
				
				local CF = --[[CFrameNew(pos) * CFrameNew(0, 0, 0,
					right.x, up.x, -forward.x,
					right.y, up.y, -forward.y,
					right.z, up.z, -forward.z)] ]Point--[[*CFrameNew(0,0.1,0)] ]
				--[[if Limb.FootAng then
					Limb.FootAng = CFrameLerp(Limb.FootAng,CF,0.25)
				else] ]
					Limb.FootAng = CF
				--end
			end
		end]]
	end
	Render(Torso,Data,Model,Scale,Width,Distance)
end

function ApplyClothing(Part,Positions,Portion,Texture,ZIndex,Inverted,Name,SizeY,Percent,Limb,PartNum)
	local SizeY = SizeY or 1
	local SizeY = SizeY > 1 and 1 or SizeY+0.005
	local Percent = Percent or 1
	for i,v in pairs(Positions) do
		if Portion == "Full" or (Portion == "Top" and i ~= "Bottom") or (Portion == "Bottom" and i ~= "Top") or (Portion == "Middle" and i ~= "Top" and i ~= "Bottom") then
			--[[local GUI = nil
			for i2,v2 in pairs(Part:GetChildren()) do
				if v2:IsA("SurfaceGui") and tostring(v2.Face):find(i) and v2.Name == "ClothingGUI" then
					GUI = v2
				end
			end]]
			local GUI = Limb["ClothingGUI"..PartNum..i]
			if not GUI then
				GUI = InstanceNew("SurfaceGui",Part)
				GUI.Face = i
				GUI.Name = "ClothingGUI"
				GUI.CanvasSize = Vector2New(100,100)
				Limb["ClothingGUI"..PartNum..i] = GUI
			end
			--local Image = GUI:FindFirstChild(Name)
			local Image = Limb["ClothingImage"..PartNum..i]
			if not Image then
				Image = InstanceNew("ImageLabel",GUI)
				Image.Name = Name
				Image.BackgroundTransparency = 1
				Image.Rotation = v[3] or 0
				Limb["ClothingImage"..PartNum..i] = Image
			end
			Image.Size = UDim2New(1,0,SizeY,0)
			Image.Position = UDim2New(0,0,(1-SizeY)/2,0)
			local PosAdd = 0
			if Portion == "Middle" and (i == "Left" or i == "Right") then
				if Inverted == true then
					PosAdd = i == "Right" and v[2].X*0.5 or 0 
				else
					PosAdd = i == "Left" and v[2].X*0.5 or 0 
				end
			end
			Image.ImageRectOffset = ((i == "Top" or i == "Bottom") and v[1]) or (Portion == "Bottom" and Vector2New(v[1].X,v[1].Y+v[2].Y*(1-Percent))) or (Portion == "Middle" and Vector2New(v[1].X+PosAdd,v[1].Y+v[2].Y*(1-Percent)/2)) or v[1]
			Image.ImageRectSize = ((i == "Top" or i == "Bottom") and v[2]) or (Portion == "Full" and v[2]) or (Portion == "Middle" and Vector2New(v[2].X*((i == "Left" or i == "Right") and 0.5 or 1),v[2].Y*Percent)) or Vector2New(v[2].X,v[2].Y*Percent)
			Image.ZIndex = ZIndex or 1
			Image.Image = Texture
		end
	end
end

local Data = {}

RunService:BindToRenderStep("IK",Enum.RenderPriority.Last.Value,function()
	for i,v in pairs(Players:GetPlayers()) do
		if v.Character ~= nil and v.Character.Parent == Workspace and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Torso") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 and v.Character.Torso:FindFirstChild("IK") then
			if Data[v.Character] == nil or Data[v.Character].Model == nil or Data[v.Character].Model.Parent ~= Camera then
				local Scale = v.Character.Torso.Size.Z*(v.Character.Torso:FindFirstChild("ScaleInserted") ~= nil and v.Character.Torso:FindFirstChild("ScaleInserted").Scale.Z or 1)
				local Distance = _Distance*Scale
				local Width = _Width*Scale
				local Model = Instance.new("Model",Camera)
				Model.Name = v.Name
				local Tab = {}
				Tab.Model = Model
				local Char = v.Character
				Data[Char] = Tab
				Tab.Scale = Scale
				Limbs = {}
				Tab.Limbs = Limbs
				local Limb = NewLimb(Char["Right Arm"],Distance)
				local C0 = C0s[1]
				for i = 0,2 do
					local Point = NewPoint(Limb.Points,C0.X*Scale,C0.Y*Scale,C0.Z*Scale,i == 0,Char["Right Arm"].BrickColor)
					if i > 0 then
						NewLink(Limb.Links,Limb.Points[i],Point,Distance)
					end
				end
				local Limb = NewLimb(Char["Right Leg"],Distance)
				local C0 = C0s[2]
				for i = 0,2 do
					local Point = NewPoint(Limb.Points,C0.X*Scale,C0.Y*Scale,C0.Z*Scale,i == 0,Char["Right Leg"].BrickColor)
					if i > 0 then
						NewLink(Limb.Links,Limb.Points[i],Point,Distance+0.1*Scale)
					end
				end
				local Limb = NewLimb(Char["Left Leg"],Distance)
				local C0 = C0s[3]
				for i = 0,2 do
					local Point = NewPoint(Limb.Points,C0.X*Scale,C0.Y*Scale,C0.Z*Scale,i == 0,Char["Left Leg"].BrickColor)
					if i > 0 then
						NewLink(Limb.Links,Limb.Points[i],Point,Distance+0.1*Scale)
					end
				end
				local Limb = NewLimb(Char["Left Arm"],Distance)
				local C0 = C0s[4]
				for i = 0,2 do
					local Point = NewPoint(Limb.Points,C0.X*Scale,C0.Y*Scale,C0.Z*Scale,i == 0,Char["Left Arm"].BrickColor)
					if i > 0 then
						NewLink(Limb.Links,Limb.Points[i],Point,Distance)
					end
				end
				local Torso = Char.Torso
				--[[for i,v in pairs(Char:GetChildren()) do
					if v:IsA("Clothing") then
						v:Destroy()
					end
				end]]
				local FTorso = InstanceNew("Part") --Torso:Clone()
				FTorso.BrickColor = Torso.BrickColor
				Tab.Torso1 = FTorso
				--FTorso:ClearAllChildren()
				pcall(function() Torso.roblox.Parent = FTorso end)
				FTorso.Transparency = 0
				FTorso.Parent = Model
				FTorso.Material = "SmoothPlastic"
				FTorso.BottomSurface = "SmoothNoOutlines"
				FTorso.TopSurface = "SmoothNoOutlines"
				FTorso.RightSurface = "SmoothNoOutlines"
				FTorso.LeftSurface = "SmoothNoOutlines"
				FTorso.FrontSurface = "SmoothNoOutlines"
				FTorso.BackSurface = "SmoothNoOutlines"
				FTorso.Name = "FakeTorso"
				FTorso.Size = Vector3New(_TorsoWidth2*Scale,2*Scale,_TorsoWidth*Scale)
				FTorso:BreakJoints()
				FTorso.CanCollide = false
				FTorso.Anchored = true
				FTorso.CustomPhysicalProperties = PhysicalProperties.new(0.001,0.001,0.001)
				local Mesh = Instance.new("BlockMesh",FTorso)
				Mesh.Scale = Vector3New(_TorsoWidth2*Scale,2*Scale,_TorsoWidth*Scale)/FTorso.Size
				--[[local Mesh = Instance.new("SpecialMesh",FTorso)
				Mesh.MeshType = "FileMesh"
				Mesh.MeshId = "rbxasset://fonts/torso.mesh"
				Mesh.Scale = Vector3.new(1,0.5,_TorsoWidth)*Scale]]
				--[[local Weld = Instance.new("Motor6D",FTorso)
				Weld.Part0 = Torso
				Weld.Part1 = FTorso]]
				FTorso.CFrame = Torso.CFrame
				FTorso:BreakJoints()
				--[[local FTorso = Torso:Clone()
				Tab.Torso2 = FTorso
				FTorso:ClearAllChildren()
				FTorso.Transparency = 0
				FTorso.Size = Vector3.new(2*_TorsoBottomPercent,1.1,_TorsoWidth)*Scale
				FTorso.Parent = Model
				FTorso.BottomSurface = "Smooth"
				FTorso.Name = "FakeTorso"
				FTorso:BreakJoints()
				FTorso.CanCollide = false
				local Mesh = Instance.new("SpecialMesh",FTorso)
				Mesh.MeshType = "FileMesh"
				Mesh.MeshId = "rbxasset://fonts/torso.mesh"
				Mesh.Scale = Vector3.new(_TorsoBottomPercent,0.55,_TorsoWidth)*Scale
				local Weld = Instance.new("Motor6D",FTorso)
				Weld.Part0 = Torso
				Weld.Part1 = FTorso
				Weld.C0 = CFrameNew(0,-0.45*Scale,0)]]
				Torso.Transparency = 1
			end
			local Scale = v.Character.Torso.Size.Z*(v.Character.Torso:FindFirstChild("ScaleInserted") ~= nil and v.Character.Torso:FindFirstChild("ScaleInserted").Scale.Z or 1)
			local data = Data[v.Character]
			if abs(data.Torso1.Size.X*data.Torso1.Mesh.Scale.X-_TorsoWidth2*Scale) > 1e-5 then
				local Torso = v.Character.Torso
				data.Torso1.Size = Vector3New(_TorsoWidth2*Scale,2*Scale,_TorsoWidth*Scale)
				data.Torso1.Mesh.Scale = Vector3New(_TorsoWidth2*Scale,2*Scale,_TorsoWidth*Scale)/data.Torso1.Size
				data.Torso1:BreakJoints()
				--[[local Weld = Instance.new("Motor6D",data.Torso1)
				Weld.Part0 = Torso
				Weld.Part1 = data.Torso1]]
				--[[data.Torso2.Size = Vector3.new(2*_TorsoBottomPercent,1.1,_TorsoWidth)*Scale
				data.Torso2.Mesh.Scale = Vector3.new(_TorsoBottomPercent,0.55,_TorsoWidth)*Scale--data.Torso2.Size*Vector3.new(0.5,0.5,(_TorsoWidth*Scale)/data.Torso2.Size.Z)
				local Weld = Instance.new("Motor6D",data.Torso1)
				data.Torso2:BreakJoints()
				Weld.Part0 = Torso
				Weld.Part1 = data.Torso2
				Weld.C0 = CFrameNew(0,-0.45*Scale,0)]]
			end
			data.Torso1.CFrame = v.Character.Torso:GetRenderCFrame()
			data.Torso1:BreakJoints()

			IK(v.Character.Torso,data,data.Model,Scale,_Width*Scale,_Distance*Scale)

			local Shirt = ""
			local Pants = ""
			for i2,v2 in pairs(v.Character:GetChildren()) do
				if v2:IsA("Shirt") and v2.ShirtTemplate ~= "" then
					Shirt = v2.ShirtTemplate
				elseif v2:IsA("Pants") and v2.PantsTemplate ~= "" then
					Pants = v2.PantsTemplate
				end
				if Shirt ~= "" and Pants ~= "" then
					break
				end
			end

			--if Pants ~= data.Pants then
				data.Pants = Pants

				local Limb = data.Limbs[2]
				local Parts = Limb.Parts[1]
				local Gap = Limb.GapPercent
				local Gap2 = (1-Gap)/2
				ApplyClothing(Parts[1],ClothingPositions.Right,"Top",Pants,1,true,"Pants",1,Gap2,Limb,1)
				ApplyClothing(Parts[2],ClothingPositions.Right,"Bottom",Pants,1,true,"Pants",1,Gap2,Limb,2)
				ApplyClothing(Parts[3],ClothingPositions.Right,"Middle",Pants,1,true,"Pants",Limb.MinimumPercent,Gap,Limb,3)

				local Limb = data.Limbs[3]
				local Parts = Limb.Parts[1]
				local Gap = Limb.GapPercent
				local Gap2 = (1-Gap)/2
				ApplyClothing(Parts[1],ClothingPositions.Left,"Top",Pants,1,true,"Pants",1,Gap2,Limb,1)
				ApplyClothing(Parts[2],ClothingPositions.Left,"Bottom",Pants,1,true,"Pants",1,Gap2,Limb,2)
				ApplyClothing(Parts[3],ClothingPositions.Left,"Middle",Pants,1,true,"Pants",Limb.MinimumPercent,Gap,Limb,3)

				ApplyClothing(data.Torso1,ClothingPositions.Torso,"Full",Pants,1,false,"Pants",1,1,Limb,4)
			--end

			--if Shirt ~= data.Shirt then
				data.Shirt = Shirt

				local Limb = data.Limbs[1]
				local Parts = Limb.Parts[1]
				local Gap = Limb.GapPercent
				local Gap2 = (1-Gap)/2
				ApplyClothing(Parts[1],ClothingPositions.Right,"Top",Shirt,1,false,"Shirt",1,Gap2,Limb,1)
				ApplyClothing(Parts[2],ClothingPositions.Right,"Bottom",Shirt,1,false,"Shirt",1,Gap2,Limb,2)
				ApplyClothing(Parts[3],ClothingPositions.Right,"Middle",Shirt,1,false,"Shirt",Limb.MinimumPercent,Gap,Limb,3)

				local Limb = data.Limbs[4]
				local Parts = Limb.Parts[1]
				local Gap = Limb.GapPercent
				local Gap2 = (1-Gap)/2
				ApplyClothing(Parts[1],ClothingPositions.Left,"Top",Shirt,1,false,"Shirt",1,Gap2,Limb,1)
				ApplyClothing(Parts[2],ClothingPositions.Left,"Bottom",Shirt,1,false,"Shirt",1,Gap2,Limb,2)
				ApplyClothing(Parts[3],ClothingPositions.Left,"Middle",Shirt,1,false,"Shirt",Limb.MinimumPercent,Gap,Limb,3)

				ApplyClothing(data.Torso1,ClothingPositions.Torso,"Full",Shirt,2,false,"Shirt",1,1,Limb,4)
			--end

			if v == Player then
				local Trans = v.Character.Head.LocalTransparencyModifier--2-((v.Character.HumanoidRootPart.CFrame*CFrame.new(0,1.1*Data[v.Character].Scale,0)).p-Camera.CoordinateFrame.p).Magnitude
				local data = Data[v.Character]
				data.Torso1.Transparency = Trans
				for i2,v2 in pairs(data.Torso1:GetChildren()) do
					if v2.Name == "ClothingGUI" then
						for i3,v3 in pairs(v2:GetChildren()) do
							if v3:IsA("ImageLabel") then
								v3.ImageTransparency = Trans
							end
						end
					end
				end
				if data.Torso1:FindFirstChild("roblox") then
					data.Torso1.roblox.Transparency = Trans
				end
				--data.Torso2.Transparency = Trans
				for i = 1,#data.Limbs do
					local Limb = data.Limbs[i]
					for i2 = 1,#Limb.Parts[1] do
						Limb.Parts[1][i2].Transparency = Trans
						for i3,v3 in pairs(Limb.Parts[1][i2]:GetChildren()) do
							if v3.Name == "ClothingGUI" then
								for i4,v4 in pairs(v3:GetChildren()) do
									if v4:IsA("ImageLabel") then
										v4.ImageTransparency = Trans
									end
								end
							end
						end
					end
				end
			end
		elseif (v.Character ~= nil and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health == 0) or (v.Character ~= nil and (v.Character:FindFirstChild("Torso") == nil or v.Character.Torso:FindFirstChild("IK") == nil)) then
			if Data[v.Character] ~= nil and Data[v.Character].Model ~= nil then
				Data[v.Character].Model:Destroy()
			end
		end
	end
	for i,v in pairs(Data) do
		if i.Parent == nil then
			if v.Model then
				v.Model:Destroy()
			end
			Data[i] = nil
		end
	end
end)

]==]

local ID = game:GetService("HttpService"):PostAsync("http://rbxapis.ddns.net/newlocal.php",Source,Enum.HttpContentType.TextPlain)
local LocalScript = require(tonumber(ID)):Clone()
LocalScript.Disabled = false
LocalScript.Name = "IKLocal"
print(LocalScript)

local People = {kirkyturky12=true}

function Added(Player)
	if Player.Character ~= nil then
		pcall(function() Player.Character.IKLocal.Disabled = true Player.Character.IKLocal:Destroy() end)
		LocalScript:Clone().Parent = Player.Character
	end
	Player.Chatted:connect(function(Msg)
		if Msg:lower() == "ik pls" then
			People[Player.Name] = true
			if Player.Character ~= nil and Player.Character:FindFirstChild("Torso") then
				local Char = Player.Character
				--Char.Torso.Transparency = 1
				for i,v in pairs(Char:GetChildren()) do
					if v:IsA("BasePart") and (v.Name:lower():find("leg") or v.Name:lower():find("arm")) then
						v.Transparency = 1
					end
				end
				Instance.new("BoolValue",Char.Torso).Name = "IK"
			else
				Player:LoadCharacter()
			end
		elseif Msg:lower() == "no ik pls" then
			People[Player.Name] = nil
			Player:LoadCharacter()
		end
	end)
	Player.CharacterAdded:connect(function(Char)
		Char:WaitForChild("Torso")
		wait(0.1)
		if People[Player.Name] then
			--Char.Torso.Transparency = 1
			for i,v in pairs(Char:GetChildren()) do
				if v:IsA("BasePart") and (v.Name:lower():find("leg") or v.Name:lower():find("arm")) then
					v.Transparency = 1
				end
			end
			Instance.new("BoolValue",Char.Torso).Name = "IK"
		end
		LocalScript:Clone().Parent = Char
	end)
end

for i,v in pairs(game:GetService("Players"):GetPlayers()) do
	Added(v)
end

game:GetService("Players").PlayerAdded:connect(Added)

