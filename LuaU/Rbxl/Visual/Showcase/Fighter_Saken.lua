local armmovments = false
local plr = game:GetService('Players').LocalPlayer
local chr = plr.Character
local maus = plr:GetMouse()
local PGui=plr.PlayerGui
local lleg = chr["Left Leg"]
local rleg = chr["Right Leg"]
local larm = chr["Left Arm"]
local rarm = chr["Right Arm"]
local hed = chr.Head
local rutprt = chr.HumanoidRootPart
local torso = chr.Torso
local otheranims=false
local swimming=false
chr.Animate.Disabled=true
local fldb={['w']=false,['a']=false,['s']=false,['d']=false}
local RunSpeed=50
local WlkSpeed=30
local SwimSpeed=14
local SwimDashSpeed=28
local anim = "Idling"
local lastanim = "Idling"
local val = 0
local syne = 0
local num = 0
local runtime = 0
local pseudohead=hed:Clone()
for i,x in pairs(pseudohead:GetChildren()) do if not x.ClassName:find('Mesh') then x:Destroy() end end
pseudohead.Name='PseudoHead'
pseudohead.Parent=chr.Head
local pseudoweld=Instance.new('Weld',torso)
pseudoweld.Part0=hed
pseudoweld.Name='PseudoHedWld'
pseudoweld.Part1=pseudohead
hed.Transparency=1
	local Player = game:GetService('Players').LocalPlayer
	local Character = Player.Character
	local Mouse = Player:GetMouse()
	local LeftArm = Character:WaitForChild("Left Arm")
	local RightArm = Character:WaitForChild("Right Arm")
	local LeftLeg = Character:WaitForChild("Left Leg")
	local RightLeg = Character:WaitForChild("Right Leg")
	local Head = Character:WaitForChild("Head")
	local Torso = Character:WaitForChild("Torso")
	z = Instance.new("Sound", torso)
	z.SoundId = "rbxassetid://" -- Put Music ID Here.
	z.Looped = true
	z.Pitch = 0.82
	z.Volume = 1
	wait(.1)
	z:Play()
	local RootPart = Character:WaitForChild("HumanoidRootPart")
	local Humanoid = Character:WaitForChild("Humanoid")
	local LeftShoulder = Torso:WaitForChild("Left Shoulder")
	local RightShoulder = Torso:WaitForChild("Right Shoulder")
	local LeftHip = Torso:WaitForChild("Left Hip")
	local RightHip = Torso:WaitForChild("Right Hip")
	local Neck = Torso:WaitForChild("Neck")
	local RootJoint = RootPart:WaitForChild("RootJoint")
	local Camera = workspace.CurrentCamera
	local FLeftShoulder, FRightShoulder = Instance.new("Weld", Torso), Instance.new("Weld", Torso)
	FLeftShoulder.Name = "LS"
	FRightShoulder.Name = "RS"
	local FLeftHip, FRightHip = Instance.new("Weld", Torso), Instance.new("Weld", Torso)
	FLeftHip.Name = "LH"
	FRightHip.Name = "RH"
	local FRootJoint = Instance.new("Weld", RootPart)
	FRootJoint.Name = "RJ"
	local F1, F2, F3 = Instance.new("Folder", Character), Instance.new("Folder"), Instance.new("Folder")
	F1.Name = "Parts Folder"
	F2.Parent = F1
	F2.Name = "Effects"
	F3.Parent = F1
	F3.Name = "Extra Parts"
	local Drag_To_Part = Instance.new("Part", F3)
	Drag_To_Part.Transparency = 1
	Drag_To_Part.Name = "Drag-to-part"
	Drag_To_Part.Size = Vector3.new(0.2, 0.2, 0.2)
	Drag_To_Part.Anchored = false
	Drag_To_Part.CanCollide = false
	Drag_To_Part.Locked = true
	local DTPWeld = Instance.new("Weld", Drag_To_Part)
	DTPWeld.Part0 = RootPart
	DTPWeld.Part1 = Drag_To_Part
	local WepWeld, WepWeld2, WepWeld3, SheWeld = nil, nil, nil, nil
	local NLSC0 = LeftShoulder.C0
	local NLSC1 = LeftShoulder.C1
	local NRSC0 = RightShoulder.C0
	local NRSC1 = RightShoulder.C1
	local NLHC0 = LeftHip.C0
	local NLHC1 = LeftHip.C1
	local NRHC0 = RightHip.C0
	local NRHC1 = RightHip.C1
	local NNC0 = Neck.C0
	local NNC1 = Neck.C1
	local NRJC0 = RootJoint.C0
	local NRJC1 = RootJoint.C1
	local Handle, Hit_Box, Handle2, Hit_Box2, TEHandle, TESHandle, TEHit_Box, CEP = nil, nil, nil, nil, nil, nil, nil, nil
	local chatServ = game:GetService("Chat")
	local runServ = game:GetService("RunService")
	local debServ = game:GetService("Debris")
	local CurrentSpeed = 16
	local Current_Anim = "Idle"
	local Attack_Num = 1
	local Damage_Buff = 0
	local Max_Health = 400
	local Last_Health = Max_Health
	local idle = 1
	local idlenum = 1
	local idlenum2 = 1
	local walk = 1
	local walknum = 1
	local walknum2 = 1
	local Effects = {}
	local DragTable = {}
	local InputTable = {}
	local InputFrameTable = {}
	local TEBladeP = {}
	local TEBEffect, c1, c2 = nil, nil, nil
	local RGyro = Instance.new("BodyGyro")
	RGyro.MaxTorque = Vector3.new(0, 0, 0)
	RGyro.P = 2000
	local LLCF = CFrame.new()
	local SWP = Instance.new("BoolValue")
	local ControlScript = Player.PlayerScripts:WaitForChild("ControlScript")
	local Z_Pressed = false
	local Debounces = {Equipped = false, Equipping = false, HasWep = false, DuelWielding = false, Attacking = false, Locked_On = false, Can_Double_Jump = false, AnimOverride = false, Guarding = false, Crouching = false, JumpAnim = false, DoubleJumpAnim = false, KeyStrokeEnabled = false, Successful_KeyStroke = false, KeyStroke_CoolDown = false, UIAction = false, ZeroGravity = false, DoubleJumping = false, Charging_Erupt = false, Guarding = false, Transformed = false, DisableJump = false, Dashing = false, Hovering = false, TEWield = false, TESWield = false, CanGuard = true, SpedUp = false, HurrSlash = false, Stompped = false}
	local rad = math.rad
	local huge = math.huge
	local rand = math.random
	local Vec = Vector3.new
	local Cf = CFrame.new
	local Euler = CFrame.fromEulerAnglesXYZ
	local BC = BrickColor.new
	local Col3 = Color3.new
	local Inst = Instance.new
	local Ud2 = UDim2.new



	local FONT = "SourceSansLight"


	MakeText = function(text, font, duration, tcr, tcg, tcb, scr, scg, scb, cFrame)
	local tpart = Instance.new("Part")
	tpart.Parent = F2
	tpart.Transparency = 1
	tpart.Name = "hoi hoi"
	tpart.Anchored = true
	tpart.CanCollide = false
	tpart.Locked = true
	tpart.Size = Vector3.new(0.2, 0.2, 0.2)
	tpart.CFrame = cFrame * CFrame.new(math.random(-2, 2), 0, math.random(-2, 2))
	local bill = Instance.new("BillboardGui")
	bill.Parent = tpart
	bill.AlwaysOnTop = true
	bill.Name = "HUHHHHHNAAAA"
	bill.Size = UDim2.new(4, 0, 4, 0)
	bill.StudsOffset = Vector3.new(0, 1, 0)
	local counter = 0
	local textl = Instance.new("TextLabel")
	textl.Parent = bill
	textl.Name = "WHYYYYYYYY"
	textl.BackgroundTransparency = 1
	textl.Size = UDim2.new(1, 0, 1, 0)
	textl.Font = font
	textl.Text = text
	textl.TextColor3 = Color3.new(tcr / 255, tcg / 255, tcb / 255)
	textl.TextScaled = true
	textl.TextStrokeColor3 = Color3.new(scr / 255, scg / 255, scb / 255)
	textl.TextStrokeTransparency = 0
	coroutine.resume(coroutine.create(function()
		while textl.TextTransparency < 1 do
						swait()
						if bill.StudsOffset.Y >= 5 then
							if duration <= counter then
								textl.TextTransparency = textl.TextTransparency + 0.15
								textl.TextStrokeTransparency = textl.TextStrokeTransparency + 0.15
							end
						end
				counter = counter + 0.1
			bill.StudsOffset = Vector3.new(0, bill.StudsOffset.Y + 0.15, 0)
		end
		debServ:AddItem(bill, 0)
		debServ:AddItem(textl, 0)
		debServ:AddItem(tpart, 0)
	end))
end

	Apply_Buff = function(amount, duration)
	
	coroutine.resume(coroutine.create(function()
		
		if amount > 0 and duration > 0 then
			Damage_Buff = Damage_Buff + amount
			MakeText("+" .. amount .. " Damage", FONT, 0.3, 255, 0, 0, 0, 0, 0, RootPart.CFrame)
			wait(duration)
			Damage_Buff = Damage_Buff - amount
			MakeText("-" .. amount .. " Damage", FONT, 0.3, 255, 0, 0, 0, 0, 0, RootPart.CFrame)
		end
	end
))
end

	Apply_Health_Buff = function(amount, duration)
	
	coroutine.resume(coroutine.create(function()
		
		if amount > 0 and duration > 0 then
			Max_Health = Max_Health + amount
			coroutine.resume(coroutine.create(function()
			
			wait()
			Humanoid.Health = Humanoid.Health + amount
		end
))
			MakeText("+" .. amount .. " Max Health", FONT, 0.3, 255, 170, 0, 0, 0, 0, RootPart.CFrame)
			wait(duration)
			Max_Health = Max_Health - amount
			MakeText("-" .. amount .. " Max Health", FONT, 0.3, 255, 170, 0, 0, 0, 0, RootPart.CFrame)
		end
	end
))
end
	
	
	FindHum = function(parent)
	
	local hm = nil
	for _,HM in pairs(parent:GetChildren()) do
		if HM:IsA("Humanoid") then
			hm = HM
		end
	end
	return hm
end


ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "Heartbeat"
script:WaitForChild("Heartbeat")
frame = 0.033333333333333
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
  tf = tf + s
  if frame <= tf then
    if allowframeloss then
      script.Heartbeat:Fire()
      lastframe = tick()
    else
      for i = 1, math.floor(tf / frame) do
        script.Heartbeat:Fire()
      end
      lastframe = tick()
    end
    if tossremainder then
      tf = 0
    else
      tf = tf - frame * math.floor(tf / frame)
    end
  end
end
)
swait = function(num)
  if num == 0 or num == nil then
    ArtificialHB.Event:wait()
  else
    for i = 0, num do
      ArtificialHB.Event:wait()
    end
  end
end

	local DamageFunction = function(Hit, IsRan, MinDam, MaxDam, HKB, Knockback, DamType, Property, Duration, HDrag, DragDuration, SoEff, SoID, SoPit, SoVol)
	
	local humanoid = FindHum(Hit.Parent)
	if humanoid and humanoid ~= Humanoid then
		local IsSafe = true
		local Deb = humanoid:FindFirstChild("ChaosDebounce")
		if Deb then
			local Cre = Deb:FindFirstChild("Creator")
				if Cre and Cre.Value == Player.UserId then
						IsSafe = false
				end
			end
		if IsSafe then
			local deb = Inst("BoolValue", humanoid)
			deb.Name = "ChaosDebounce"
			local cre = Inst("NumberValue", deb)
			cre.Name = "Creator"
			cre.Value = Player.UserId
			debServ:AddItem(deb, Duration)
			debServ:AddItem(cre, Duration)
			local Damage = 1
			if IsRan then
				Damage = rand(MinDam, MaxDam)
			else
				Damage = MaxDam
			end
			local this_nigga_had_op_health = false
				if SoEff then
					local HitSound = Sound(Hit, "http://roblox.com/asset/?id=" .. SoID .. "", SoVol, SoPit, false)
					debServ:AddItem(HitSound, 6)
				end
				-- DECOMPILER ERROR at PC100: Unhandled construct in 'MakeBoolean' P1

				if (DamType == "Compensate" or string.sub(DamType, 1, 10) == "Compensate") and (humanoid.MaxHealth >= 100000 or humanoid.MaxHealth == 0) then
					if humanoid.MaxHealth >= 1000000000 or humanoid.MaxHealth == 0 then
						humanoid.MaxHealth = 100
						this_nigga_had_op_health = true
					end
					Damage = Damage * (humanoid.MaxHealth / 100)
				end
				if humanoid.MaxHealth >= 100000000 or humanoid.MaxHealth == 0 then
					this_nigga_had_op_health = true
					humanoid.MaxHealth = 100
				end
				if Damage_Buff > 0 then
					Damage = Damage * Damage_Buff
				end
				humanoid.Health = humanoid.Health - Damage
				if humanoid.MaxHealth / 4 <= Damage then
					MakeText("-" .. Damage .. "", "SourceSansBold", 0.3, 170, 0, 0, 255, 85, 0, Hit.CFrame)
				else
					local mtc = BrickColor.new("Really black").Color
					MakeText("-" .. Damage .. "", FONT, 0.3, mtc.r * 255, mtc.g * 255, mtc.b * 255, 0, 0, 0, Hit.CFrame)
				end
				do
					if HKB and (DamType ~= "SkyRocket" or DamType ~= "Compensate-SkyRocket") then
						if Property.Name ~= "Point" then
							humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
							local KBCF = Cf(Hit.Position, Property.Position)
							Hit.Velocity = KBCF.lookVector * -Knockback
						else
							do
								Hit.Velocity = Property.CFrame.lookVector * Knockback
								if (DamType == "Normal" and DamType == "Stun") or DamType == "Compensate-Stun" then
									MakeText("Stunned", FONT, 0.3, 255, 255, 0, 0, 0, 0, Hit.CFrame)
									humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
									local pos = Inst("BodyPosition", Hit)
									pos.MaxForce = Vec(huge, huge, huge)
									pos.Position = Hit.Position
									debServ:AddItem(pos, Duration * 10)
								else
									do
										if DamType == "LifeSteal" or DamType == "Compensate-LifeSteal" then
											Humanoid.Health = Humanoid.Health + Damage / 2
											MakeText("+" .. Damage / 2, FONT, 0.4, 0, 0, 0, 0, 255, 0, RootPart.CFrame)
										else
											if DamType == "MomentumStopper" or DamType == "Compensate-MomentumStopper" then
												local vel = Inst("BodyVelocity", Hit)
												vel.Name = "MomentumStopper"
												vel.MaxForce = Vec(huge, huge, huge)
												vel.Velocity = Vec(0, 0, 0)
												debServ:AddItem(vel, 3)
											else
												do
													if DamType == "Knockdown" or DamType == "Compensate-Knockdown" then
														humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
													else
														if DamType == "SkyRocket" or DamType == "Compensate-SkyRocket" then
															humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
															Hit.Velocity = Vec(0, Knockback, 0)
															if rand(1, 4) == 1 then
																local Twista = Inst("BodyAngularVelocity", Hit)
																Twista.MaxTorque = Vec(1000000, 1000000, 1000000)
																Twista.AngularVelocity = Vec(rand(-2, 2) * (Knockback / 2), rand(-2, 2) * (Knockback / 2), rand(-2, 2) * (Knockback / 2))
																debServ:AddItem(Twista, 0.01)
															end
														else
															do
																if DamType == "FreezeStun" or DamType == "Compensate-FreezeStun" then
																	MakeText("Stunned", FONT, 0.3, 0, 0, 0, 255, 170, 0, Hit.CFrame)
																	coroutine.resume(coroutine.create(function()
		
		local ti = 0
		local hHead = Hit.Parent:FindFirstChild("Head")
		if hHead then
			hHead = Hit
			local h = Inst("Part", F2)
			h.Size = Vec(0.2, 0.2, 0.2)
			h.CanCollide = false
			h.Transparency = 1
			h.Position = hHead.Position
			local hWELD = Inst("Weld", h)
			hWELD.Part0 = hHead
			hWELD.Part1 = h
			hWELD.C0 = Cf(0, -4, 0)
			repeat
				ti = ti + 0.1
				for _,p in pairs(humanoid.Parent:GetChildren()) do
					if p:IsA("BasePart") then
						p.Anchored = true
					end
				end
				swait()
				humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
				local p1 = hHead.Position + Vec(rand(-200, 200) / 100, -(hHead.Size.y * 1.5), rand(-200, 200) / 100)
				local p0 = h.Position
				Lightning(p0, p1, 5, 3, "Deep orange", "Neon", 0.1, 0.2, 0.2)
			until Duration * 12 <= ti
			for _,p in pairs(humanoid.Parent:GetChildren()) do
				if p:IsA("BasePart") then
					p.Anchored = false
				end
			end
			debServ:AddItem(h, 0)
		end
	end
))
																else
																	if DamType == "KnockDownFreezeStun" or DamType == "Compensate-KnockDownFreezeStun" then
																		MakeText("Stunned", FONT, 0.3, 0, 0, 0, 255, 64, 0, Hit.CFrame)
																		coroutine.resume(coroutine.create(function()
		
		local ti = 0
		local scf = nil
		local h = Inst("Part", F2)
		h.Size = Vec(0.2, 0.2, 0.2)
		h.CanCollide = false
		h.Anchored = true
		h.Transparency = 1
		h.Position = Hit.Position
		h.CFrame = h.CFrame * Euler(rad(-90), 0, 0)
		local IL = {Character, Hit.Parent}
		local Ground, Pos = workspace:FindPartOnRayWithIgnoreList(Ray.new(h.Position, h.CFrame.lookVector.Unit * 999), IL, true, true)
		if Ground then
			Hit.CFrame = Cf(Pos) * Euler(rad(-90), 0, 0)
			scf = Cf(Pos) * Euler(rad(-90), 0, 0)
		end
		repeat
			ti = ti + 0.1
			for _,p in pairs(humanoid.Parent:GetChildren()) do
				if p:IsA("BasePart") then
					p.Anchored = true
				end
			end
			Hit.CFrame = scf
			swait()
			humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
		until Duration * 7 <= ti
		for _,p in pairs(humanoid.Parent:GetChildren()) do
			if p:IsA("BasePart") then
				p.Anchored = false
			end
		end
		debServ:AddItem(h, 0)
	end
))
																	end
																end
																if HDrag then
																	humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
																	local pos = Inst("BodyPosition", Hit)
																	pos.MaxForce = Vec(huge, huge, huge)
																	pos.Position = Drag_To_Part.Position
																	local d = Inst("NumberValue", pos)
																	d.Name = "Duration"
																	d.Value = DragDuration
																	table.insert(DragTable, pos)
																end
																do
																	if this_nigga_had_op_health then
																		coroutine.resume(coroutine.create(function()
		
		swait()
		Damage = Damage * 2
		humanoid.Health = humanoid.Health - Damage
		MakeText("-" .. Damage .. "", FONT, 0.4, 0, 0, 0, 0, 0, 91, Hit.CFrame)
	end
))
																	end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
	end
end

	MagniDamage = function(Part, range, isRan, mindam, maxdam, hkb, knock, DType, dur, hd, dd, soe, soid, sopit, sovol)
	
	for _,c in pairs(workspace:GetChildren()) do
		local hum = FindHum(c)
		if hum and hum ~= Humanoid then
			local head = c:FindFirstChild("Head")
			local tor = c:FindFirstChild("Torso")
			local larm = c:FindFirstChild("Left Arm")
			local rarm = c:FindFirstChild("Right Arm")
			local lleg = c:FindFirstChild("Left Leg")
			local rleg = c:FindFirstChild("Right Leg")
			local Dis = range
			local Par = nil
				if head then
					local Mag = (head.Position - Part.Position).magnitude
					if Mag <= Dis then
						Dis = Mag
						Par = head
					end
				end
					if tor then
						local Mag = (tor.Position - Part.Position).magnitude
						if Mag <= Dis then
							Dis = Mag
							Par = tor
						end
					end
						if rarm then
							local Mag = (rarm.Position - Part.Position).magnitude
							if Mag <= Dis then
								Dis = Mag
								Par = rarm
							end
						end
							if larm then
								local Mag = (larm.Position - Part.Position).magnitude
								if Mag <= Dis then
									Dis = Mag
									Par = larm
								end
							end
								if rleg then
									local Mag = (rleg.Position - Part.Position).magnitude
									if Mag <= Dis then
										Dis = Mag
										Par = rleg
									end
								end
										if lleg then
											local Mag = (lleg.Position - Part.Position).magnitude
											if Mag <= Dis then
												Dis = Mag
												Par = lleg
											end
										end
										if Par then
											DamageFunction(Par, isRan, mindam, maxdam, hkb, knock, DType, Part, dur, hd, dd, soe, soid, sopit, sovol)
										end
										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out DO_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_THEN_STMT

										-- DECOMPILER ERROR at PC113: LeaveBlock: unexpected jumping out IF_STMT

									end
	end
end






	CreatePart = function(className, parent, Brickcolor, Material, Transparency, Reflectance, Name, Size, Position, Rotation, MeshClass, MeshScale, MeshId, MeshType)
	
	local Part = Instance.new(className, parent)
	Part.BrickColor = BrickColor.new(Brickcolor)
	Part.Transparency = Transparency
	Part.Reflectance = Reflectance
	Part.Material = Material
	Part.Name = Name
	Part.Anchored = true
	Part.CanCollide = false
	Part.Locked = true
	Part.Size = Size
	Part.Position = Position
	Part.Rotation = Rotation
	Part.TopSurface = "SmoothNoOutlines"
	Part.BottomSurface = "SmoothNoOutlines"
	Part.FrontSurface = "SmoothNoOutlines"
	Part.BackSurface = "SmoothNoOutlines"
	Part.RightSurface = "SmoothNoOutlines"
	Part.LeftSurface = "SmoothNoOutlines"
	local Mesh = Instance.new(MeshClass, Part)
	Mesh.Scale = MeshScale
	if MeshClass == "SpecialMesh" then
		Mesh.MeshId = MeshId
		Mesh.MeshType = MeshType
	end
	return Part
end



	rayCast = function(Pos, Dir, Max, Ignore)
	
	return game:service("Workspace"):FindPartOnRay(Ray.new(Pos, Dir.unit * (Max or 999.999)), Ignore)
end

	local Point = Torso.CFrame * Cf(0, Torso.Size.Y, 0)
	LastPoint = Point
	effect = function(Color, Ref, LP, P1, returnn)
	
	local effectsmsh = Instance.new("CylinderMesh")
	effectsmsh.Scale = Vector3.new(0.2, 1, 0.2)
	effectsmsh.Name = "Mesh"
	local effectsg = Instance.new("Part")
	effectsg.formFactor = 3
	effectsg.CanCollide = false
	effectsg.Name = "Eff"
	effectsg.Locked = true
	effectsg.Anchored = true
	effectsg.Size = Vector3.new(0.5, 1, 0.5)
	effectsg.Parent = F2
	effectsmsh.Parent = effectsg
	effectsg.BrickColor = BrickColor.new(Color)
	effectsg.Reflectance = Ref
	local point1 = P1
	local mg = (LP.p - point1.p).magnitude
	effectsg.Size = Vector3.new(0.5, mg, 0.5)
	effectsg.CFrame = Cf((LP.p + point1.p) / 2, point1.p) * CFrame.Angles(math.rad(90), 0, 0)
	effectsmsh.Scale = Vector3.new(0.2, 1, 0.2)
	game:GetService("Debris"):AddItem(effectsg, 2)
	if returnn then
		return effectsg
	end
	coroutine.resume(coroutine.create(function(Part, Mesh)
		
		if not returnn then
			for i = 0, 1, 0.05 do
				swait()
				Part.Transparency = 1 * i
				Mesh.Scale = Vector3.new(0.5 - 0.5 * i, 1, 0.5 - 0.5 * i)
			end
			Part.Parent = nil
		end
	end
), effectsg, effectsmsh)
end

	local CFrameFromTopBack = function(at, top, back)
	
	local right = top:Cross(back)
	return CFrame.new(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

	NoOutline = function(Part)
	
	Part.TopSurface = 10
end

	pert = function(parent, reflectance, transparency, brickcolor, name, size, material)
	
	local fp = Inst("Part")
	fp.Parent = parent
	fp.Reflectance = reflectance
	fp.Transparency = transparency
	fp.CanCollide = false
	fp.Locked = true
	fp.BrickColor = brickcolor
	fp.Name = name
	fp.Size = size
	fp.Position = Torso.Position
	NoOutline(fp)
	fp.Material = material
	fp:BreakJoints()
	return fp
end

	mesh = function(Mesh, part, meshtype, meshid, offset, scale)
	
	local mesh = Inst(Mesh)
	mesh.Parent = part
	if Mesh == "SpecialMesh" then
		mesh.MeshType = meshtype
		mesh.MeshId = meshid
	end
	mesh.Offset = offset
	mesh.Scale = scale
	return mesh
end

	MagicBlock = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("BlockMesh", prt, "", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Block1", Delay, x3, y3, z3})
end

	MagicBlock2 = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("BlockMesh", prt, "", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Disappear", Delay, x3, y3, z3})
end

	MagicSpikeBall = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/Asset/?id=9982590", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Block1", Delay, x3, y3, z3})
end

	MagicCircle = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "Sphere", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Cylinder", Delay, x3, y3, z3})
end

	MagicWave = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=20329976", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Cylinder", Delay, x3, y3, z3})
end

	MagicWave2 = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=20329976", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Wave", Delay, x3, y3, z3})
end

	MagicCylinder = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(0.2, 0.2, 0.2), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "Head", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	Effects[#Effects + 1] = {prt, "Cylinder", Delay, x3, y3, z3}
end

	MagicCylinder2 = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(0.2, 0.2, 0.2), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("CylinderMesh", prt, "", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	Effects[#Effects + 1] = {prt, "Cylinder", Delay, x3, y3, z3}
end

	MagicBlood = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "Sphere", "", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Blood", Delay, x3, y3, z3})
end

	MagicRing = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=3270017", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Cylinder", Delay, x3, y3, z3})
end

	MagicRing2 = function(brickcolor, material, cframe, x1, y1, z1, x3, y3, z3, Delay)
	
	local prt = pert(F2, 0, 0, brickcolor, "Effect", Vec(), material)
	prt.Anchored = true
	prt.CFrame = cframe
	local msh = mesh("SpecialMesh", prt, "FileMesh", "http://www.roblox.com/asset/?id=3270017", Vec(0, 0, 0), Vec(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 5)
	table.insert(Effects, {prt, "Blood", Delay, x3, y3, z3})
end

	ElecEffect = function(brickCol, Mat, cff, x, y, z)
	
	local prt = pert(F2, 0, 0, brickCol, "Part", Vec(1, 1, 1), Mat)
	prt.Anchored = true
	prt.CFrame = cff * Cf(rand(-x, x), rand(-y, y), rand(-z, z))
	prt.CFrame = Cf(prt.Position)
	debServ:AddItem(prt, 2)
	local xval = math.random() / 2
	local yval = math.random() / 2
	local zval = math.random() / 2
	local msh = mesh("BlockMesh", prt, "", "", Vec(0, 0, 0), Vec(xval, yval, zval))
	Effects[#Effects + 1] = {prt, "Elec", 0.1, x, y, z, xval, yval, zval}
end

	Lightning = function(p0, p1, tym, ofs, col, mat, th, tra, last)
	
	local magz = (p0 - p1).magnitude
	local curpos = p0
	local trz = {-ofs, ofs}
	for i = 1, tym do
		local li = Instance.new("Part", F2)
		li.TopSurface = 0
		li.BottomSurface = 0
		li.Anchored = true
		li.Transparency = tra or 0.4
		li.BrickColor = BrickColor.new(col)
		li.Material = mat
		li.Material = "Neon"
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(th, th, magz / tym)
		local ofz = Vector3.new(trz[math.random(1, 2)], trz[math.random(1, 2)], trz[math.random(1, 2)])
		local trolpos = CFrame.new(curpos, p1) * CFrame.new(0, 0, magz / tym).p + ofz
		if tym == i then
			local magz2 = (curpos - p1).magnitude
			li.Size = Vector3.new(th, th, magz2)
			li.CFrame = CFrame.new(curpos, p1) * CFrame.new(0, 0, -magz2 / 2)
			game:GetService("Debris"):AddItem(li, last)
		else
					li.CFrame = CFrame.new(curpos, trolpos) * CFrame.new(0, 0, magz / tym / 2)
					curpos = li.CFrame * CFrame.new(0, 0, magz / tym / 2).p
					game:GetService("Debris"):AddItem(li, last)
		end
	end
end

	Triangle = function(a, b, c, tcol, tmat)
	
	local edg1 = (c-a):Dot((b-a).unit)
	local edg2 = (a-b):Dot((c-b).unit)
	local edg3 = (b-c):Dot((a-c).unit)
	if edg1 <= (b - a).magnitude and edg1 >= 0 then
		a = a
	elseif edg2 <= (c - b).magnitude and edg2 >= 0 then
			a = b
		elseif edg3 <= (a - c).magnitude and edg3 >= 0 then
				a = c
			else
				return 
			end
	local len1 = (c-a):Dot((b-a).unit)
local len2 = (b-a).magnitude - len1
local width = (a + (b-a).unit*len1 - c).magnitude
	local maincf = CFrameFromTopBack(a, (b-a):Cross(c-b).unit, -(b-a).unit)
	local list = {}
	if len1 > 0.01 then
		local w1 = Inst("WedgePart", F2)
		w1.Material = tmat
		w1.BrickColor = BC(tcol)
		w1.Transparency = 0
		w1.Reflectance = 0
		w1.CanCollide = false
		NoOutline(w1)
		local sz = Vec(0.2, width, len1)
		w1.Size = sz
		local sp = Inst("SpecialMesh", w1)
		sp.MeshType = "Wedge"
		sp.Scale = Vec(0, 1, 1) * sz / w1.Size
		w1:BreakJoints()
		w1.Anchored = true
		w1.Transparency = 0.7
		debServ:AddItem(w1, 25)
		table.insert(Effects, {w1, "Disappear", 0.045})
		w1.CFrame = maincf * CFrame.Angles(math.pi, 0, math.pi / 2) * CFrame.new(0, width / 2, len1 / 2)
		table.insert(list, w1)
	end
		if len2 > 0.01 then
			local w2 = Inst("WedgePart", F2)
			w2.Material = tmat
			w2.BrickColor = BC(tcol)
			w2.Transparency = 0
			w2.Reflectance = 0
			w2.CanCollide = false
			NoOutline(w2)
			local sz = Vec(0.2, width, len2)
			w2.Size = sz
			local sp = Inst("SpecialMesh", w2)
			sp.MeshType = "Wedge"
			sp.Scale = Vec(0, 1, 1) * sz / w2.Size
			w2:BreakJoints()
			w2.Anchored = true
			w2.Transparency = 0.7
			debServ:AddItem(w2, 25)
			table.insert(Effects, {w2, "Disappear", 0.045})
			w2.CFrame = maincf * CFrame.Angles(math.pi, math.pi, -math.pi / 2) * CFrame.new(0, width / 2, -len1 - len2 / 2)
			table.insert(list, w2)
		end
			return unpack(list)
	end


runServ.RenderStepped:connect(function()
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * Euler(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[1]:FindFirstChild("Mesh")
							if not Mesh then
								Mesh = Instance.new("BlockMesh")
							end
							Mesh.Scale = Mesh.Scale + Vec(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Wave" then
								Thing[1].CFrame = Thing[1].CFrame * CFrame.Angles(0, rad(10), 0)
								Mesh = Thing[1]:FindFirstChild("Mesh")
								if not Mesh then
									Mesh = Instance.new("BlockMesh")
								end
								Mesh.Scale = Mesh.Scale + Vec(Thing[4], Thing[5], Thing[6])
								Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							elseif Thing[2] == "Cylinder" then
									Mesh = Thing[1]:FindFirstChild("Mesh")
									if not Mesh then
										Mesh = Instance.new("BlockMesh")
									end
									Mesh.Scale = Mesh.Scale + Vec(Thing[4], Thing[5], Thing[6])
									Thing[1].Transparency = Thing[1].Transparency + Thing[3]
								elseif Thing[2] == "Blood" then
										Mesh = Thing[1]:FindFirstChild("Mesh")
										if not Mesh then
											Mesh = Instance.new("BlockMesh")
										end
										Thing[1].CFrame = Thing[1].CFrame * Cf(0, 0.5, 0)
										Mesh.Scale = Mesh.Scale + Vec(Thing[4], Thing[5], Thing[6])
										Thing[1].Transparency = Thing[1].Transparency + Thing[3]
									elseif Thing[2] == "Elec" then
											Mesh = Thing[1]:FindFirstChild("Mesh")
											if not Mesh then
												Mesh = Instance.new("BlockMesh")
											end
											Mesh.Scale = Mesh.Scale + Vec(Thing[7], Thing[8], Thing[9])
											Thing[1].Transparency = Thing[1].Transparency + Thing[3]
										elseif Thing[2] == "Disappear" then
												Thing[1].Transparency = Thing[1].Transparency + Thing[3]
										end
					else
						Part.Parent = nil
						debServ:AddItem(Part, 0)
						table.remove(Effects, e)
					end
				end
			end
		end
	end
end)






maus.KeyDown:connect(function(kei)
if string.byte(kei)==48 and not otheranims then
runnin=true
end
if kei=='w' then fldb.w=true end
if kei=='a' then fldb.a=true end
if kei=='s' then fldb.s=true end
if kei=='d' then fldb.d=true end
end)
maus.KeyUp:connect(function(kei)
if string.byte(kei)==48 and not otheranims then
runnin=false
end
if kei=='w' then fldb.w=false end
if kei=='a' then fldb.a=false end
if kei=='s' then fldb.s=false end
if kei=='d' then fldb.d=false end
end)



maus.KeyDown:connect(function(kei)
if kei=='z' and attack ~= "false" then 

attackone()

elseif kei=='x' and attack ~= "false" then 

attacktwo()

elseif kei=='c' and attack ~= "false" then 

attackthree()

elseif kei=='v' and attack ~= "false" then

Untimatum()

end
end)





coroutine.wrap(function()
for i,x in pairs(hed:GetChildren()) do if x:IsA('Sound') then x:Destroy() end end end)()
function Lerp(a, b, i)
local com1 = {a.X, a.Y, a.Z, a:toEulerAnglesXYZ()}
local com2 = {b.X, b.Y, b.Z, b:toEulerAnglesXYZ()}
local calx = com1[1] + (com2[1] - com1[1]) * i
local caly = com1[2] + (com2[2] - com1[2]) * i
local calz = com1[3] + (com2[3] - com1[3]) * i
local cala = com1[4] + (com2[4] - com1[4]) * i
local calb = com1[5] + (com2[5] - com1[5]) * i
local calc = com1[6] + (com2[6] - com1[6]) * i
return CFrame.new(calx, caly, calz) * CFrame.Angles(cala, calb, calc)
end
function TwnSingleNumber(s,f,m)
local wot=s+(f-s)*m
return wot
end
function TwnVector3(q,w,e)
local begin={q.x,q.y,q.z}
local ending={w.x,w.y,w.z}
local bgx=begin[1]+(ending[1]-begin[1])*e
local bgy=begin[2]+(ending[2]-begin[2])*e
local bgz=begin[3]+(ending[3]-begin[3])*e
return Vector3.new(bgx,bgy,bgz)
end
newWeld = function(wld, wp0, wp1, wc0x, wc0y, wc0z)
wld = Instance.new("Weld", wp1)
wld.Part0 = wp0
wld.Part1 = wp1
wld.C0 = CFrame.new(wc0x, wc0y, wc0z)
end
newWeld(law, torso, larm, -1.5, 0.5, 0)
newWeld(raw, torso, rarm, 1.5, 0.5, 0)
newWeld(llw, torso, lleg, -.5, -2, 0)
newWeld(rlw, torso, rleg, .5, -2, 0)
newWeld(hw, torso, hed, 0, 1.5, 0)
local rutwald=Instance.new('Weld',rutprt)
rutwald.Part0=rutprt
rutwald.Part1=torso
rutprt.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),math.rad(0),0)
larm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rarm.Weld.C1 = CFrame.new(0, 0.5, 0)*CFrame.Angles(math.rad(0),0,0)
rleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)
lleg.Weld.C1=CFrame.new(0,0,0)*CFrame.Angles(math.rad(0),0,0)

local function setupPart(part)
    part.Anchored = true
    part.FormFactor = 'Custom'
    part.CanCollide = false
    part.BrickColor = BrickColor.new("Dark indigo")
    part.Material = "Neon"
    part.TopSurface = 'SmoothNoOutlines'
    part.BottomSurface = 'SmoothNoOutlines'
    part.FrontSurface = 'SmoothNoOutlines'
    part.BackSurface = 'SmoothNoOutlines'
    part.LeftSurface = 'SmoothNoOutlines'
    part.RightSurface = 'SmoothNoOutlines'
end

function CFrameFromTopBack(at, top, back)
    local right = top:Cross(back)
    return CFrame.new(at.x, at.y, at.z, right.x, top.x, back.x, right.y, top.y, back.y, right.z, top.z, back.z)
end

function CreateTriangle(parent, a, b, c)
    local this = {}
    local mPart1 = Instance.new('WedgePart')
    setupPart(mPart1)
    local mPart2 = Instance.new('WedgePart')
    setupPart(mPart2)
    function this:Set(a, b, c) --[[ edg1 A ------|------>B --. '\ | / \ \part1|part2/ | \ cut / / Direction edges point in: edg3 \ / edg2 / (clockwise) \ / |/ \<- / ` \ / C --]]
        local ab, bc, ca = b-a, c-b, a-c local abm, bcm, cam = ab.magnitude, bc.magnitude, ca.magnitude
        local edg1 = math.abs(0.5 + ca:Dot(ab)/(abm*abm))
        local edg2 = math.abs(0.5 + ab:Dot(bc)/(bcm*bcm))
        local edg3 = math.abs(0.5 + bc:Dot(ca)/(cam*cam))
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

        local len1 = -ca:Dot(ab)/abm local len2 = abm - len1 local width = (ca + ab.unit*len1).magnitude
        local maincf = CFrameFromTopBack(a, ab:Cross(bc).unit, -ab.unit)
        
        mPart1.Parent = parent
        mPart1.Size = Vector3.new(1,1,1)
        mPart1.CFrame = maincf*CFrame.Angles(math.pi,0,math.pi/2)*CFrame.new(0,width/2,len1/2)
        local Mesh = Instance.new("SpecialMesh",mPart1)
        Mesh.MeshType = "Wedge"
        Mesh.Scale = Vector3.new(0.005, width, len1)

        mPart2.Parent = parent
        mPart2.Size = Vector3.new(1,1,1)
        mPart2.CFrame = maincf*CFrame.Angles(math.pi,math.pi,-math.pi/2)*CFrame.new(0,width/2,-len1 - len2/2)
        local Mesh = Instance.new("SpecialMesh",mPart2)
        Mesh.MeshType = "Wedge"
        Mesh.Scale = Vector3.new(0.005, width, len2)
    end

    function this:SetProperty(prop, value)
        mPart1[prop] = value
        mPart2[prop] = value
    end
    
    function this:GetProperty(prop)
        return mPart1[prop]
    end
    
    this:Set(a, b, c)
    function this:Destroy()
        mPart1:Destroy()
        mPart2:Destroy()
    end
    return this
end
function CreateTrail(Adornee, Axis)
    local Axis = Axis or "X"
    
    local trail = {}
    trail.Triangles = {}
    trail.Adornee = Adornee
    trail.Axis = Axis
    
    local L1, L2
    
    function trail:Fade(speed)
        local speed = speed or 0.01     
        
        for n, v in pairs(trail.Triangles) do
            v:SetProperty("Transparency", v:GetProperty("Transparency") + speed)
            if v:GetProperty("Transparency") >= 1 then
                v:Destroy()
                
                table.remove(trail.Triangles, n)
            end
        end
    end
    
    function trail:Update()
        local adornee = trail.Adornee
        
        local axis = trail.Axis
        local Size = Vector3.new((axis == "X" and adornee.Size.X or 0), (axis == "Y" and adornee.Size.Y or 0), (axis == "Z" and adornee.Size.Z or 0))
        local P1 = adornee.CFrame * CFrame.new(Size / 2)
        local P2 = adornee.CFrame * CFrame.new(Size / -2)
        
        if L1 and L2 then
            table.insert(trail.Triangles, CreateTriangle(adornee, L1.p, L2.p, P1.p))
            table.insert(trail.Triangles, CreateTriangle(adornee, P1.p, P2.p, L2.p))
        end
        
        L1, L2 = P1, P2
    end
    
    return trail
end






	Player=game:GetService('Players').LocalPlayer
	Character=Player.Character
	Mouse=Player:GetMouse()
	m=Instance.new('Model',Character)


	local function weldBetween(a, b)
	    local weldd = Instance.new("ManualWeld")
	    weldd.Part0 = a
	    weldd.Part1 = b
	    weldd.C0 = CFrame.new()
	    weldd.C1 = b.CFrame:inverse() * a.CFrame
	    weldd.Parent = a
	    return weldd
	end
	
	it=Instance.new
	
	function nooutline(part)
		part.TopSurface,part.BottomSurface,part.LeftSurface,part.RightSurface,part.FrontSurface,part.BackSurface = 10,10,10,10,10,10
	end
	
	function part(formfactor,parent,material,reflectance,transparency,brickcolor,name,size)
		local fp=it("Part")
		fp.Shape=formfactor
		fp.Parent=parent
		fp.Reflectance=reflectance
		fp.Transparency=transparency
		fp.CanCollide=false
		fp.Locked=true
		fp.BrickColor=BrickColor.new(tostring(brickcolor))
		fp.Name=name
		fp.Size=size
		fp.Position=torso.Position
		nooutline(fp)
		fp.Material=material
		fp:BreakJoints()
		return fp
	end
	
	
	function mesh(Mesh,part,meshtype,meshid,offset,scale)
		local mesh=it(Mesh)
		mesh.Parent=part
		if Mesh=="SpecialMesh" then
			mesh.MeshType=meshtype
			mesh.MeshId=meshid
		end
		mesh.Offset=offset
		mesh.Scale=scale
		return mesh
	end
	
	function weld(parent,part0,part1,c0,c1)
		local weld=it("Weld")
		weld.Parent=parent
		weld.Part0=part0
		weld.Part1=part1
		weld.C0=c0
		weld.C1=c1
		return weld
	end

local Spheres = it("Model")
Spheres.Parent=Character
	

Main_Head=part(Enum.PartType.Ball,m,Enum.Material.Neon,0,0.4099999666214,"Mulberry","Handle",Vector3.new(2.96000004, 2.96000004, 2.96000004))
Main_Headweld=weld(m,Character["Torso"],Main_Head,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.00997161865, 0.0349311829, -4.91999435, 1, 0, 0, 0, 0, -1, 0, 1, 0))
MainH_Part=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Really black","MainH_Part",Vector3.new(1.7518369, 1.7518369, 1.7518369))
MainH_Partweld=weld(m,Main_Head,MainH_Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, -0.0603561401, 1.62124634e-005, 1, 0, 0, 0, 1, 0, 0, 0, 1))


Main_RH=part(Enum.PartType.Cylinder,m,Enum.Material.Marble,0,0,"Eggplant","Handle",Vector3.new(0.200000003, 0.929999948, 0.929999948))
Main_RHweld=weld(m,Character["Right Leg"],Main_RH,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.959936023, 0.0700092316, -0.0149731636, 0, 0.999999881, 0, -1, 0, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_RH,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950025678, -0.479959488, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_RH,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950011849, 0.410047531, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Sphere_RH1=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Institutional white","Sphere_RH1",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_RH1weld=weld(m,Main_RH,Sphere_RH1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 0.190037251, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))


TrailThingy1 = CreateTrail(Sphere_RH1,"Y")



Main_LH=part(Enum.PartType.Cylinder,m,Enum.Material.Marble,0,0,"Eggplant","Handle",Vector3.new(0.200000003, 0.929999948, 0.929999948))
Main_LHweld=weld(m,Character["Left Leg"],Main_LH,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.954887033, -7.62939453e-006, -0.0149731636, 0, 0.999999881, 0, -1, 0, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_LH,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.95002377, -0.479957581, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_LH,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950009704, 0.410041809, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Sphere_LH1=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Institutional white","Sphere_LH1",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_LH1weld=weld(m,Main_LH,Sphere_LH1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 0.190037251, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))

TrailThingy2 = CreateTrail(Sphere_LH1,"Y")


Main_RW=part(Enum.PartType.Cylinder,m,Enum.Material.Marble,0,0,"Eggplant","Handle",Vector3.new(0.200000003, 0.929999948, 0.929999948))
Main_RWweld=weld(m,Character["Right Arm"],Main_RW,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.964890003, -0.0200252533, -0.0149731636, 0, 0.999999881, 0, -1, 0, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_RW,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950019598, -0.479948044, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_RW,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950009584, 0.460039902, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Sphere_RW2=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Really black","Sphere_LW2",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_RW2weld=weld(m,Main_RW,Sphere_RW2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, -1.94488883, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))
Sphere_RW1=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Really black","Sphere_LW1",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_RW1weld=weld(m,Main_RW,Sphere_RW1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0, 0.190035343, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))


TrailThingy3 = CreateTrail(Sphere_RW1,"Y")


Main_LW=part(Enum.PartType.Cylinder,m,Enum.Material.Marble,0,0,"Eggplant","Handle",Vector3.new(0.200000003, 0.929999948, 0.929999948))
Main_LWweld=weld(m,Character["Left Arm"],Main_LW,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.974956036, 0.0399856567, -0.0149731636, 0, 0.999999881, 0, -1, 0, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_LW,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950020552, -0.479957581, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))
Sphere_LW1=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Really black","Sphere_LW1",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_LW1weld=weld(m,Main_LW,Sphere_LW1,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.52587891e-005, 0.190036297, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))
Sphere_LW2=part(Enum.PartType.Ball,Spheres,Enum.Material.Neon,0,0,"Really black","Sphere_LW2",Vector3.new(0.559999943, 0.559999943, 0.559999943))
Sphere_LW2weld=weld(m,Main_LW,Sphere_LW2,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.52587891e-005, -1.98496461, 0, 0, -1, 0, 0.999999762, 0, 0, 0, 0, 1))
Part=part(Enum.PartType.Block,m,Enum.Material.Marble,0,0,"Eggplant","Part",Vector3.new(2.08000016, 0.200000003, 0.200000003))
Partweld=weld(m,Main_LW,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.950009584, 0.410041809, 0, 0.999999762, 0, 0, 0, 1, 0, 0, 0, 1))

TrailThingy5 = CreateTrail(Sphere_LW1,"Y")


local particleemitter = Instance.new("ParticleEmitter", MainH_Part)
PARSI = .5
particleemitter.Lifetime = NumberRange.new(0.2)
particleemitter.Speed = NumberRange.new(0)

game:service'RunService'.RenderStepped:connect(function()
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, PARSI), NumberSequenceKeypoint.new(1, PARSI)})
end)

particleemitter.Rate = 1000
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.LightEmission = 1
particleemitter.Color = ColorSequence.new(Color3.new(0.639216, 0.227451, 1), Color3.new(0.639216, 0.227451, 1))
particleemitter.Texture = "http://www.roblox.com/asset/?id=243098098"
particleemitter.LockedToPart = true

local particleemitter = Instance.new("ParticleEmitter", MainH_Part)

particleemitter.Lifetime = NumberRange.new(0.2)
particleemitter.Speed = NumberRange.new(0)

game:service'RunService'.RenderStepped:connect(function()
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, PARSI), NumberSequenceKeypoint.new(1, PARSI)})
end)

particleemitter.Rate = 1000
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.LightEmission = 1
particleemitter.Color = ColorSequence.new(Color3.new(0.639216, 0.227451, 1), Color3.new(0.639216, 0.227451, 1))
particleemitter.Texture = "http://www.roblox.com/asset/?id=243098098"
particleemitter.LockedToPart = true


local particleemitter = Instance.new("ParticleEmitter", MainH_Part)

particleemitter.Lifetime = NumberRange.new(0.2)
particleemitter.Speed = NumberRange.new(0)

game:service'RunService'.RenderStepped:connect(function()
particleemitter.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, PARSI), NumberSequenceKeypoint.new(1, PARSI)})
end)

particleemitter.Rate = 1000
particleemitter.Rotation = NumberRange.new(0, 360)
particleemitter.LightEmission = 1
particleemitter.Color = ColorSequence.new(Color3.new(0.639216, 0.227451, 1), Color3.new(0.639216, 0.227451, 1))
particleemitter.Texture = "http://www.roblox.com/asset/?id=243098098"
particleemitter.LockedToPart = true


local particleemitterglow = Instance.new("ParticleEmitter", MainH_Part)

particleemitterglow.Lifetime = NumberRange.new(1)
particleemitterglow.Speed = NumberRange.new(0)
particleemitterglow.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 10), NumberSequenceKeypoint.new(0.102, 1), NumberSequenceKeypoint.new(0.353, 8.063), NumberSequenceKeypoint.new(0.56, 2.938), NumberSequenceKeypoint.new(0.703, 8.563), NumberSequenceKeypoint.new(1, 0)})
particleemitterglow.Rate = 5
particleemitterglow.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.1, 0.5), NumberSequenceKeypoint.new(0.8, 0.5), NumberSequenceKeypoint.new(1, 1)})
particleemitterglow.Name = "ParticleEmitterGlow"
particleemitterglow.LightEmission = 1
particleemitterglow.Color = ColorSequence.new(Color3.new(0.333333, 0, 0), Color3.new(0.333333, 0, 0))
particleemitterglow.Texture = "http://www.roblox.com/asset/?id=243660373"
particleemitterglow.LockedToPart = true





game:service'RunService'.RenderStepped:connect(function()

if anim == "Sprinting" then
		TrailThingy3:Update()
		TrailThingy3:Fade(0.2)	
		TrailThingy5:Update()	
		TrailThingy5:Fade(0.2)
		TrailThingy1:Update()
		TrailThingy1:Fade(0.2)
		TrailThingy2:Update()
		TrailThingy2:Fade(0.2)
end

if anim ~= "Sprinting" then
		TrailThingy3:Update()
		TrailThingy3:Fade(1)	
		TrailThingy5:Update()	
		TrailThingy5:Fade(1)
		TrailThingy1:Update()
		TrailThingy1:Fade(1)
		TrailThingy2:Update()
		TrailThingy2:Fade(1)
end

if anim~=lastanim then
runtime=0
end
lastanim=anim
chr.Humanoid.CameraOffset=(rutprt.CFrame:toObjectSpace(hed.CFrame)).p+Vector3.new(0,-1.25,0)
syne=syne+.95
if not otheranims and not swimming then
if (torso.Velocity*Vector3.new(1, 0, 1)).magnitude < 1 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Idling"
elseif (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude > 1 and (rutprt.Velocity*Vector3.new(1, 0, 1)).magnitude < RunSpeed-10 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Walking"
elseif (torso.Velocity*Vector3.new(1, 0, 1)).magnitude > RunSpeed-10 and not chr.Humanoid.Jump then-- and torso.Velocity.y<5 and torso.Velocity.y>-5
anim="Sprinting"
elseif torso.Velocity.y>5 and chr.Humanoid.Jump then
anim='Jumping'
elseif (torso.Velocity.y < -5) and chr.Humanoid.Jump then
anim='Falling'
end
end

if otheranims then return end
if anim=="Idling"  then
idlesineinc=35
rutprt.Weld.C0=Lerp(rutprt.Weld.C0,CFrame.new(0,3-1*math.cos(syne/10),0)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0)),.1)

if not armmovments then
rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(0,0,math.rad(3)),.1)
larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525+math.cos(syne/idlesineinc)/25,0)*CFrame.Angles(0,0,math.rad(-3)),.1)
end

lleg.Weld.C0 = Lerp(lleg.Weld.C0, CFrame.new(-0.55, -1.4-0.1*math.cos(syne/10), -0.55) * CFrame.Angles(math.rad(-10+1*math.cos(syne/10)), math.rad(10), math.rad(-0-2*math.cos(syne/10))), 0.4)
rleg.Weld.C0 = Lerp(rleg.Weld.C0, CFrame.new(0.55, -2-0.1*math.cos(syne/10), 0) * CFrame.Angles(0, math.rad(-10), math.rad(0+2*math.cos(syne/10))), 0.4)
hed.Weld.C0=Lerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/idlesineinc)/50,0)*CFrame.Angles(math.cos(syne/idlesineinc)/40,0,0),.1)
end

if anim=="Walking"  then

if not armmovments then
rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0) * CFrame.Angles(math.rad(-30), math.rad(0), math.rad(-40)), 0.3)
larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)* CFrame.Angles(math.rad(-30), math.rad(0), math.rad(40)), 0.3)
end

lleg.Weld.C0=Lerp(lleg.Weld.C0,CFrame.new(-.55,-1.9-math.cos(syne/6)/10,-(math.cos(syne/6)/1.125))*CFrame.Angles(math.cos(syne/6)/1.125,0,math.rad(-2.5)),.1)
rleg.Weld.C0=Lerp(rleg.Weld.C0,CFrame.new(.55,-1.9-math.cos(syne/6)/10,math.cos(syne/6)/1.125)*CFrame.Angles(-(math.cos(syne/6)/1.125),0,math.rad(2.5)),.1)
hed.Weld.C0=Lerp(hed.Weld.C0,CFrame.new(0,1.55+math.cos(syne/20)/50,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(20),0,0),.1)
rutprt.Weld.C0=Lerp(rutprt.Weld.C0,CFrame.new(0,3+math.cos(syne/2.5)/15,math.cos(syne/2.5))*CFrame.Angles(math.cos(syne/2.5)/10+math.rad(-25),math.cos(syne/2.5)/10,math.cos(syne/4)/20+math.sin(rutprt.RotVelocity.y/2)/4),.1)
end

if anim=="Sprinting"  then
ArmsTrail = true

if not armmovments then
rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-55),0,math.rad(12.5)),.1)
larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(-55),0,math.rad(-12.5)),.1)
end

lleg.Weld.C0=Lerp(lleg.Weld.C0,CFrame.new(-.55,-1.6-math.cos(syne/4)/4,-(math.cos(syne/4)*2)-math.rad(10))*CFrame.Angles(math.cos(syne/4)*2+math.rad(10),0,math.rad(-2.5)),.1)
rleg.Weld.C0=Lerp(rleg.Weld.C0,CFrame.new(.55,-1.6-math.cos(syne/4)/4,math.cos(syne/4)*2-math.rad(10))*CFrame.Angles(-(math.cos(syne/4)*2)+math.rad(10),0,math.rad(2.5)),.1)
hed.Weld.C0=Lerp(hed.Weld.C0,CFrame.new(0,1.55+math.cos(syne/20)/50,0)*CFrame.Angles(-math.cos(syne/2.5)/10+math.rad(20),0,0),.1)
rutprt.Weld.C0=Lerp(rutprt.Weld.C0,CFrame.new(0,3+math.cos(syne/2.5)/15,math.cos(syne/2.5))*CFrame.Angles(math.cos(syne/3)/15+math.rad(-40),math.cos(syne/2.5)/10,math.cos(syne/4)/20+math.sin(rutprt.RotVelocity.y/2)/4),.1)
ArmsTrail = false
end

if anim=="Jumping"  then

if not armmovments then
rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(50)),.1)
larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-50)),.1)
end

lleg.Weld.C0=Lerp(lleg.Weld.C0,CFrame.new(-.55,-1.4,0)*CFrame.Angles(math.rad(-17.5),0,math.rad(-2.5)),.1)
rleg.Weld.C0=Lerp(rleg.Weld.C0,CFrame.new(.55,-1.1,-.1)*CFrame.Angles(math.rad(-17.5),0,math.rad(2.5)),.1)
hed.Weld.C0=Lerp(hed.Weld.C0,CFrame.new(0,1.5+math.cos(syne/20)/50,0)*CFrame.Angles(math.cos(syne/20)/40,0,0),.1)
rutprt.Weld.C0=Lerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(-15),math.rad(0),math.rad(0)),.1)
end

if anim=="Falling"  then

if not armmovments then
rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(70)),.035)
larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)*CFrame.Angles(math.rad(10),0,math.rad(-70)),.035)
end

lleg.Weld.C0=Lerp(lleg.Weld.C0,CFrame.new(-.55,-1.2,0)*CFrame.Angles(math.rad(-14),0,math.rad(-2.5)),.035)
rleg.Weld.C0=Lerp(rleg.Weld.C0,CFrame.new(.55,-1.9,0)*CFrame.Angles(math.rad(0),0,math.rad(2.5)),.035)
hed.Weld.C0=Lerp(hed.Weld.C0,CFrame.new(0,1.5,-.3)*CFrame.Angles(math.rad(-40),0,0),.035)
rutprt.Weld.C0=Lerp(rutprt.Weld.C0,CFrame.new(0,-.1+math.cos(syne/20)/20,0)*CFrame.Angles(math.rad(10),math.rad(0),math.rad(0)),.035)
end




if runnin and not otheranims and not swimming then
chr.Humanoid.WalkSpeed=RunSpeed
elseif not runnin and not otheranims and not swimming then
chr.Humanoid.WalkSpeed=WlkSpeed
end
end)


--[[]]----[[Moves]]----[[]]--
attackone = function()

  attack = true
  armmovments=true
  
  for i = 0, 1, 0.13 do
    swait()
    rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0) * CFrame.Angles(math.rad(160), math.rad(0), math.rad(-40)), 0.3)
    larm.Weld.C0=Lerp(larm.Weld.C0,CFrame.new(-1.5,.525,0)* CFrame.Angles(math.rad(160), math.rad(0), math.rad(40)), 0.3)
    PARSI = PARSI + i/2--i + i/.5
  end
wait(1)
  for i = 0, 1, 0.13  do
    swait()
    PARSI = PARSI - i/2--i + i/.5
  end

  attack = false
  armmovments=false
end




attacktwo = function()
  attack = true
  armmovments=true

  for i = 0, 20, 0.13 do
    swait()
	rarm.Weld.C0=Lerp(rarm.Weld.C0,CFrame.new(1.5,.525,0) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(0)), 0.3)
	MagniDamage(RootPart, 12, true, 1, 2, true, 10, "Compensate-Knockdown", 0.01, false, 0, false, _, "", "")
	local rnum = 20
	local Rand1, Rand2, Rand3, Rand4 = {rand(-rnum, rnum), rand(-rnum, rnum), rand(-rnum, rnum)}, {rand(-rnum, rnum), rand(-rnum, rnum), rand(-rnum, rnum)}, {rand(-360, 360), rand(-360, 360), rand(-360, 360)}, {rand(-rnum, rnum), rand(-rnum, rnum), rand(-rnum, rnum)}
	MagicSpikeBall(BrickColor.new("Royal purple"), "Neon", rarm.CFrame + Vector3.new(0,15,0), 0, 0, 0, 0.3, 0.3, 0.3, 0.1)
	MagicCircle(BrickColor.new("Really black"), "Neon", rarm.CFrame + Vector3.new(0,15,0), 0, 0, 0, 0.3, 0.3, 0.3, 0.1)
  end
  
  for i = 0, 1, 0.1 do
    swait()

  end

  attack = false
  armmovments=false
end





attackthree = function()

  attack = true
  otheranims=true
  
  for i = 0, 1, 0.13 do
    swait()

  end
  
  for i = 0, 1, 0.1 do
    swait()

  end
  otheranims=false
  attack = false
  
end




Untimatum = function()

  attack = true
  otheranims=true
  


  otheranims=false
  attack = false
end
--[[]]----[[Moves]]----[[]]--


  for i = 0, 1, 0.1 do
    swait()
MagicBlock(BrickColor.new("Really black"), "Neon", RootPart.CFrame * Cf(0, -1.15, 0), 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicBlock(BrickColor.new("Really black"), "Neon", RootPart.CFrame * Cf(0, -1.15, 0), 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicBlock(BrickColor.new("Really black"), "Neon", RootPart.CFrame * Cf(0, -1.15, 0), 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
					
MagicBlock(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame * Cf(0, -1.15, 0), 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicCircle(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicCircle(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicCircle(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicCircle(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
					
MagicBlock(BrickColor.new("Royal purple"), "SmoothPlastic", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicBlock(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.02)
					
MagicSpikeBall(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicSpikeBall(BrickColor.new("Royal purple"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
					
MagicCircle(BrickColor.new("Really black"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
MagicCircle(BrickColor.new("Really black"), "Neon", RootPart.CFrame, 0, 0, 0, 0.7, 0.7, 0.7, 0.2)
end

function Lightning(Part0,Part1,Times,Offset,Color,Thickness,Trans)
    local magz = (Part0 - Part1).magnitude
    local curpos = Part0
    local trz = {-Offset,Offset}
    for i=1,Times do
        local li = Instance.new("Part", torso)
		li.Name = "Lightning"
		li.TopSurface =0
		li.Material = "Neon"
		li.BottomSurface = 0
		li.Anchored = true
		li.Locked = true
		li.Transparency = Trans or 0.4
		li.BrickColor = BrickColor.new(Color)
		li.formFactor = "Custom"
		li.CanCollide = false
		li.Size = Vector3.new(Thickness,Thickness,magz/Times)
        local Offzet = Vector3.new(trz[math.random(1,2)],trz[math.random(1,2)],trz[math.random(1,2)])
        local trolpos = CFrame.new(curpos,Part1)*CFrame.new(0,0,magz/Times).p+Offzet
        if Times == i then
        local magz2 = (curpos - Part1).magnitude
        li.Size = Vector3.new(Thickness,Thickness,magz2)
        li.CFrame = CFrame.new(curpos,Part1)*CFrame.new(0,0,-magz2/2)
        else
        li.CFrame = CFrame.new(curpos,trolpos)*CFrame.new(0,0,magz/Times/2)
        end
        curpos = li.CFrame*CFrame.new(0,0,magz/Times/2).p
        game.Debris:AddItem(li,.1)
    end
end

BodyParts = {} -- Parts to emit lightning effects from
for _, v in pairs(Spheres:GetChildren()) do
    if v:IsA("Part") then
        table.insert(BodyParts, v)
    end
end

Bounding = {} -- Calculate the bounding boxes
for _, v in pairs(BodyParts) do
	local temp = {X=nil, Y=nil, Z=nil}
	temp.X = v.Size.X/2 * 10
	temp.Y = v.Size.Y/2 * 10
	temp.Z = v.Size.Z/2 * 10
	Bounding[v.Name] = temp
	--table.insert(Bounding, v.Name, temp)
end

while wait(math.random(1,10)/10) do -- Emit the Lightning effects randomly
	local Body1 = BodyParts[math.random(#BodyParts)]
	local Body2 = BodyParts[math.random(#BodyParts)]
	local Pos1 = Vector3.new(
		math.random(-Bounding[Body1.Name].X, Bounding[Body1.Name].X)/10,
		math.random(-Bounding[Body1.Name].Y, Bounding[Body1.Name].Y)/10,
		math.random(-Bounding[Body1.Name].Z, Bounding[Body1.Name].Z)/10
)
	local Pos2 = Vector3.new(
		math.random(-Bounding[Body2.Name].X, Bounding[Body2.Name].X)/10,
		math.random(-Bounding[Body2.Name].Y, Bounding[Body2.Name].Y)/10,
		math.random(-Bounding[Body2.Name].Z, Bounding[Body2.Name].Z)/10
)
	local SPos1 = Body1.Position + Pos1
	local SPos2 = Body2.Position + Pos2
	Lightning(SPos1, SPos2, 6, 5, "Dark indigo", .03, .56)
end


if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					local IncZ = Thing[6]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * Vector3.new(0, .5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[1].Mesh
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end
	