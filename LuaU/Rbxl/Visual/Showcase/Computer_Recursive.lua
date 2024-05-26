----------------------------
--| Important/Misc Stuff |--
----------------------------
local Services=setmetatable({},{__index=function(_,i) if game:FindService(i) then return game:GetService(i) end end;__metatable="Locked";})
local RGB = function(r,g,b) r=r or 0;g=g or 0;b=b or 0;return Color3.new(r/255,g/255,b/255) end;
local Create = function(Class)
	return function(Properties)
		local Object = type(Class)=='string' and Instance.new(Class) or Class;
		if (Properties~=nil) then
			for i,v in next,Properties do
				Object[i]=v;
			end;
		end;
		return Object;
	end;
end;
local Recurse = function(Object)
	local Collected = {};
	local Descend
	Descend = function(o)
		for i,v in pairs(o:GetChildren()) do
			if not pcall(function() return v.Name end) then return end 
			table.insert(Collected,v)
			Descend(v)
		end
	end;
	Descend(Object);
	return Collected;
end;
local StopMusic = function()
	for i,v in pairs(Recurse(game)) do
		if v:IsA("Sound") then
			v.PlayOnRemove=false;
			v.Looped=false;
			v:Stop();
			v:Destroy();
		end
	end;
end;
local MakeMusic = function(Parent,SoundId)
	StopMusic();
	Parent=Parent or workspace;
	SoundId=SoundId or 0;
	local NewSound = Create("Sound"){
		Parent=Parent;
		SoundId=("rbxassetid://%s"):format(SoundId);
		Looped=true;
		Volume=1;
	};
	NewSound:Play();
end;
local GetRainbow = function(hue)
	local section = hue % 1 * 3;
	local secondary = 0.5 * math.pi * (section % 1);
	if section < 1 then
		return Color3.new(1, 1 - math.cos(secondary), 1 - math.sin(secondary));
	elseif section < 2 then
		return Color3.new(1 - math.sin(secondary), 1, 1 - math.cos(secondary));
	else
		return Color3.new(1 - math.cos(secondary), 1 - math.sin(secondary), 1);
	end;
end;
local User = Services.Players.LocalPlayer;
----------------
--| Settings |--
----------------
local Apps = {
	Created={};
	MusicList = {
		{
			SoundId=319758951,
			BrickColor="Lapis"
		},
		{
			SoundId=191035676,
			BrickColor="Really black"
		},
		{
			SoundId=142312040,
			BrickColor="Really red"
		},
		{
			SoundId=165065112,
			BrickColor="Really black"
		},
		{
			SoundId=166471137,
			BrickColor="Medium stone grey"
		},
		{
			SoundId=208240682,
			BrickColor="Deep blue"
		},
		{
			SoundId=226788368,
			BrickColor="Deep blue"
		},
		{
			SoundId=193399717,
			BrickColor="Deep orange"
		},
		{
			SoundId=274427825,
			BrickColor="Lime green"
		},
		{
			SoundId=155949200,
			BrickColor="Black"
		},
		{
			SoundId=209864226,
			BrickColor="New Yeller"
		},
		{
			SoundId=211626338,
			BrickColor="Bright blue"
		},
		{
			SoundId=232560219,
			BrickColor="1001"
		},
		{
			SoundId=172427188,
			BrickColor="Crimson"
		},
		{
			SoundId=180115728,
			BrickColor="Cyan"
		},
		{
			SoundId=170968526,
			BrickColor="Lime green"
		},
		{
			SoundId=148492408,
			BrickColor="Royal purple"
		},
		{
			SoundId=177956804,
			BrickColor="Black"
		},
		{
			SoundId=132399469,
			BrickColor="Bright red"
		},
		{
			SoundId=218530627,
			BrickColor="Royal purple"
		},
		{
			SoundId=234627720,
			BrickColor="Lapis"
		},
		{
			SoundId=182411115,
			BrickColor="Magenta"
		},
		{
			SoundId=188712851,
			BrickColor="1001"
		},
		{
			SoundId=176454530,
			BrickColor="Medium stone grey"
		}
	};

	SettingsList = {
		{
			Text="Setting1",
			BrickColor="White"
		},
		{
			Text="Setting2",
			BrickColor="Really black"
		},
	};




	OverwatchList = {
		{
			Text="[Launch]",
			BrickColor="Really black"
		},
	};


	
	
};
local OS = {
	CurrentOS=nil;
	CurrentGui=nil;
	CurrentMouse=nil;
	Gui = {};
};
local Settings = {
	Desktop = {
		UseBackgroundImage=true;
		BackgroundImage="rbxassetid://202899851";--,465658417,465658226,344342433
		BackgroundColor = RGB(255,255,255);
	};
	Taskbar = {
		Color = RGB(0, 0, 0);
	};
	Topbar = {
		Color = RGB(0,102,102);
	};
	OSParent = User.Character;
};

 local MakeBackGround = function(id)
	Desktop = {
		UseBackgroundImage=true;
		BackgroundImage="rbxassetid://"..id;
		BackgroundColor = RGB(255,255,255);
	};
 end;

local Status = {
	CanGenerate=true;
	StartMenuIsOpen=false;
	StartMenuIsTweening=false;
};
OS.Remove = function()
	if OS.CurrentOS ~= nil and OS.CurrentOS.Parent~=nil then
		OS.CurrentOS:Destroy();
		OS.CurrentOS=nil;
	end
end;
OS.New = function()
	if not (Status.CanGenerate) then return end;
	Status.CanGenerate=false;
	OS.Remove()
	OS.CurrentOS = Create("Part"){
		Name="OS";
		Parent=Instance.new("Script",workspace);
		TopSurface="Smooth";
		BottomSurface="Smooth";
		FormFactor="Custom";
		Size=Vector3.new(22,15,0.2);
		Anchored=true;
		Locked=true;
		CanCollide=false;
	}
	OS.MakeScreen()
	OS.MakeBackground()
	OS.MakeTaskbar();
	OS.ShowApps();
	OS.GenerateMouse();
	Status.CanGenerate=true;
end;
OS.MakeScreen = function()
	OS.CurrentGui = Create("SurfaceGui"){
		Parent=OS.CurrentOS;
		Adornee=OS.CurrentOS;
		Face="Back";
		CanvasSize=Vector2.new(800,600);
	};
	OS.Gui.Main=Create("Frame"){
		Name="Main";
		Size=UDim2.new(1,0,1,0);
		Parent=OS.CurrentGui;
		BackgroundTransparency=1;
	};
	OS.Gui.Main.MouseMoved:connect(OS.MoveMouse)
end;
OS.MakeBackground = function()
	local bf=Create("Frame"){
		Parent=OS.CurrentGui:FindFirstChild("Main");
		Name="BackgroundFrame";
		Size=UDim2.new(1,0,1,0);
		BackgroundTransparency=0;
		BackgroundColor3=Settings.Desktop.BackgroundColor;
	};
	local b=Create("ImageLabel"){
		Parent=bf;
		Size=UDim2.new(1,0,1,0);
		BackgroundTransparency=1;
		Image="";
	};
	if Settings.Desktop.UseBackgroundImage then
		b.Image=Settings.Desktop.BackgroundImage;
	end
	OS.Gui.BackgroundFrame=bf;
--[[bf.MouseButton2Click:connect(function()

end)]]
	
end;


OS.MakeTaskbar = function()
	local tf=Create("Frame"){
		Parent=OS.CurrentGui:FindFirstChild("Main");
		Name="TaskbarFrame";
		Size=UDim2.new(1,0,.1,0);
		Position=UDim2.new(0,0,.9,0);
		BackgroundTransparency=.35;
		BorderSizePixel=0;
		BorderColor3=RGB(0,0,0);
		BackgroundColor3=Settings.Taskbar.Color;
	};
	local StartMenuFrame=Create("Frame"){
		Parent=tf;
		Name="StartMenuFrame";
		Size=UDim2.new(.1,0,1,0);
		Position=UDim2.new(0,0,0,0);
		BackgroundTransparency=1;
		BorderSizePixel=0;
		BorderColor3=RGB(0,0,0);
		BackgroundColor3=RGB(0,0,0);
	}; do
		StartMenuFrame.Size=UDim2.new(0,StartMenuFrame.AbsoluteSize.Y,0,StartMenuFrame.AbsoluteSize.Y);
	end
	OS.Gui.StartMenu=Create("Frame"){
		Parent=StartMenuFrame;
		Name="StartMenu";
		Size=UDim2.new(0,0,0,0);
		BackgroundTransparency=0;
		BorderSizePixel=0;
		BackgroundColor3=RGB(70,70,70);
		ZIndex=6;
	};
	local StartButton = Create("TextButton"){
		Parent=StartMenuFrame;
		Name="StartButton";
		Size=UDim2.new(1,0,1,0);
		BorderSizePixel=0;
		BackgroundTransparency=1;
		BackgroundColor3=Settings.Taskbar.Color;
		Text="";
	};
	StartButton.MouseButton1Click:connect(function(...)
		local Data={...};
		--print(unpack(Data));
		if Status.StartMenuIsTweening==false then
			if Status.StartMenuIsOpen == true then
				OS.CloseStartMenu();
			elseif Status.StartMenuIsOpen == false then
				OS.OpenStartMenu();
			end
			Status.StartMenuIsOpen = not Status.StartMenuIsOpen
		end
	end)
	for y = 1,2 do
		for x = 1,2 do
			coroutine.yield()
			local Color = RGB(255,255,255) do
				local v=x+(y*2)-2
				if v==1 then
					Color=RGB(255,255,0);
				elseif v==2 then
					Color=RGB(255,0,0);
				elseif v==3 then
					Color=RGB(0,0,255);
				elseif v==4 then
					Color=RGB(0,255,0);
				end
			end
			local xn = 1 do
				if x == 2 then
					xn = 1.5
				end
			end
			local yn = 1 do
				if y == 2 then
					yn = 1.5
				end
			end
			local f=Create("Frame"){
				Parent=StartMenuFrame;
				Size=UDim2.new(.2,0,.2,0);
				Position=UDim2.new(.2*(x*xn),0,.2*(y*yn),0);
				BackgroundColor3=Color;
				BorderSizePixel=0;
			};
		end
	end
	local Clock = Create("Frame"){
		Parent=tf;
		Name="ClockFrame";
		BackgroundTransparency=1;
		Size=UDim2.new(.1,0,1,0);
		Position=UDim2.new(.9,0,0,0);
	};
	Create("TextLabel"){
		Name="TimeLabel";
		Parent=Clock;
		Size=UDim2.new(1,0,1,0);
		TextColor3=Color3.new(1,1,1);
		Font="SourceSansBold";
		FontSize="Size18";
		Text="";
		BackgroundTransparency=1;
	};
	OS.Gui.TaskbarFrame=tf;
	OS.Gui.Clock=Clock;
end;
OS.OpenStartMenu=function()
	Status.StartMenuIsTweening=true;
	OS.Gui.StartMenu:TweenSizeAndPosition(UDim2.new(5,0,6,0),UDim2.new(0,-1,-6,0),nil,nil,.2);
	Status.StartMenuIsTweening=false;
end
OS.CloseStartMenu=function()
	Status.StartMenuIsTweening=true;
	OS.Gui.StartMenu:TweenSizeAndPosition(UDim2.new(0,0,0,0),UDim2.new(0,0,0,0),nil,nil,.2);
	Status.StartMenuIsTweening=false;
end;
OS.HandleTime=function()
	if OS.Gui.Clock and OS.Gui.Clock:FindFirstChild("TimeLabel") then
		local M="";
		local secondsInDay = 60*60*24
		local tick = math.fmod(tick(),secondsInDay)
		local hour = math.floor(tick/3600) + 5 + -5
		local minute = math.floor(tick/60 - 60*hour)
		local second = math.floor(math.fmod(tick,60))
		if (hour > 12) then M = 'PM' hour = hour - 12 else M = 'AM' end
		if hour == 0 then hour = 12 end
		if hour == 24 then hour = 1 end
		local LTime = string.format("%2.0f:%02.0f:%02.0f",hour,minute,second)
		OS.Gui.Clock.TimeLabel.Text=("%s %s"):format(LTime,M)
	end
end;
OS.Follow = function()
	Services.RunService.RenderStepped:connect(function()
		OS.HandleTime()
		if Settings.OSParent and Settings.OSParent:FindFirstChild("Torso") then
			if OS.CurrentOS and OS.CurrentOS.Parent~=nil then
				local Torso = Settings.OSParent.Torso;
				local NewPos = Torso.CFrame * CFrame.new(0,5,-10) * CFrame.Angles(math.rad(-15),0,0)
				OS.CurrentOS.CFrame = OS.CurrentOS.CFrame:lerp(NewPos,0.2)
			else
				OS.New();
			end
		end
	end)
end;

OS.GiveTopbar=function(Frame,Name)
	Name = Name or Frame.Name;
	local T = Create("TextButton"){
		Parent=Frame;
		Name=tostring(Name);
		BackgroundColor3=Settings.Topbar.Color;
		BorderColor3=RGB(0,0,0);
		Size=UDim2.new(1,0,0,30);
		BorderSizePixel=0;
		Position=UDim2.new(0,0,0,-30);
		--[[Draggable = true;
		Active = true;]]
	};
	local H = Create("TextLabel"){
		Parent=T;
		Size=UDim2.new(1,0,1,0);
		BackgroundTransparency=1;
		TextColor3=RGB(255,255,255);
		Font="SourceSansBold";
		Text=Name;
		FontSize="Size18";
	};
	local ExitButton = Create("ImageButton"){
		Parent=T;
		BackgroundTransparency=1;
		Name="ExitButton";
		Size=UDim2.new(0,T.AbsoluteSize.Y,0,T.AbsoluteSize.Y);
		Position=UDim2.new(1,-T.AbsoluteSize.Y,0,0);
		Image="rbxasset://textures/ui/CloseButton_dn.png";
	};
	ExitButton.MouseButton1Click:connect(function()
		Frame:Destroy();
	end);
end;

OS.ShowApps = function()
	for index,v in next, Apps.Created do
		v.AppFrame.Parent=OS.Gui.Main;
		v.AppFrame.Position=UDim2.new(0,10,0,((index-1)*v.AppFrame.Size.Y.Offset)+10);
	end;
end
OS.GenerateMouse = function()
	OS.CurrentMouse=Create("ImageLabel"){
		Parent=OS.Gui.Main;
		BackgroundTransparency=1;
		Size=UDim2.new(0,30,0,30);
		Image="rbxasset://textures/ui/SelectionBox.png";
		ZIndex=7;
	};
end;
OS.MoveMouse = function(x,y)
	if OS.CurrentMouse then
		OS.CurrentMouse:TweenPosition(UDim2.new(0,x-15,0,y-15),nil,nil,0)
	end
end;
Apps.New = function(Name,Frame,Function)
	local Button=Frame:FindFirstChild("AppButton");
	Button.MouseButton1Click:connect(Function);
	Apps.Created[#Apps.Created+1]={Name=Name,AppFrame=Frame,Function=Function}
end





do
	local F = Create("Frame"){
		Name="AppContainer";
		Size=UDim2.new(0,80,0,60);
		BackgroundTransparency=1;
		BorderSizePixel=0;
		Style="DropShadow";
	};
	local Button = Create("TextButton"){
		Name="AppButton";
		Parent=F;
		Text="pTunes";
		Font="SourceSans";
		FontSize="Size18";
		TextWrapped=true;
		BackgroundTransparency=.95;
		BorderSizePixel=0;
		TextColor3=RGB(255,255,255);
		BackgroundColor3=RGB(60,60,60);
		Size=UDim2.new(1,0,1,0);
	};
	Apps.New("pTunes",(function()
		return F
	end)(),function()
		local asd = Create("Frame"){
			Parent=OS.Gui.Main;
			Name="fFrame";
			Size=UDim2.new(0,400,0,400);
			Position=UDim2.new(.5,-200,.5,-200);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		local MusicListFrame = Create("ScrollingFrame"){
			Parent=asd;
			Name="ScrollFrame";
			Size=UDim2.new(1,0,1,0);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		OS.GiveTopbar(asd,"pTunes_TB")

		local md=false
            asd.pTunes_TB.MouseButton1Down:connect(function()
            md=true
            	local Mouse = game.Players.LocalPlayer:GetMouse()
                local origp=asd.Position
                local origs=UDim2.new(0,400,0,400)
                local origmp=Mouse.Position
                HolderFrame.Size = UDim2.new(0,600,0,400)
                spawn(function()
                    repeat wait() until Mouse.MouseDown == false
                    md=false
                end)
                while md do
                    local mp={OS.Assets.Mouse.Position.X.Scale,OS.Assets.Mouse.Position.X.Offset,OS.Assets.Mouse.Position.Y.Scale,OS.Assets.Mouse.Position.Y.Offset};
                    local fs={origs.X.Scale,origs.X.Offset,origs.Y.Scale,origs.Y.Offset};
                    local fp={origp.X.Scale,origp.X.Offset,origp.Y.Scale,origp.Y.Offset};
                    --local a,b=
                    local x,y=mp[2]-(fs[2]/2),mp[4]-(fs[4]/2)
                    --print(x,y)
                    asd.Position=ud(0,x,0,y)
                    lrs:wait()
                end
            end)



		for i = 1,#Apps.MusicList do
			local SongData = Apps.MusicList[i];
			local SongFrame = Create("Frame"){
				Parent=MusicListFrame;
				Name=("SongFrame #%s"):format(i);
				Size=UDim2.new(1,0,0,40);
				Position=UDim2.new(0,0,0,(i-1)*40);
				BackgroundTransparency=1;
				BorderSizePixel=0;
				BackgroundColor=BrickColor.new(SongData.BrickColor);
			};
			local SongLabel = Create("TextButton"){
				Parent=SongFrame;
				Name="SongLabel";
				Size=UDim2.new(1,0,1,0);
				TextColor3=RGB(255,255,255);
				Text=(Services.MarketplaceService:GetProductInfo(SongData.SoundId).Name);
				Font="SourceSansBold";
				FontSize="Size18";
				BorderSizePixel=0;
				BackgroundTransparency=0;
				--BackgroundColor=BrickColor.new(NewSong.BrickColor);
				BackgroundColor3=GetRainbow(tick()/2);	
			};
			MusicListFrame.CanvasSize=UDim2.new(0,0,0,(i-1)*40)
			SongLabel.MouseButton1Click:connect(function()
				MakeMusic(workspace,SongData.SoundId)
			end);
		end
	end)
end






do
	local F = Create("Frame"){
		Name="AppContainer";
		Size=UDim2.new(0,80,0,60);
		BackgroundTransparency=1;
		BorderSizePixel=0;
		Style="DropShadow";
	};
	local Button = Create("TextButton"){
		Name="AppButton";
		Parent=F;
		Text="Settings";
		Font="SourceSans";
		FontSize="Size18";
		TextWrapped=true;
		TextWrapped=true;
		BackgroundTransparency=.95;
		BorderSizePixel=0;
		TextColor3=RGB(255,255,255);
		BackgroundColor3=RGB(60,60,60);
		Size=UDim2.new(1,0,1,0);
	};
	Apps.New("Settings",(function()
		return F
	end)(),function()
		local asd = Create("Frame"){
			Parent=OS.Gui.Main;
			Name="SettingsListFrame";
			Size=UDim2.new(0,400,0,400);
			Position=UDim2.new(.5,-200,.5,-200);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		local SettingsListFrame = Create("ScrollingFrame"){
			Parent=asd;
			Name="ScrollFrame";
			Size=UDim2.new(1,0,1,0);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		OS.GiveTopbar(asd,"Settings")
		for i = 1,#Apps.SettingsList do
			local SettingsData = Apps.SettingsList[i];
			local SettingsFrame = Create("Frame"){
				Parent=SettingsListFrame;
				Name=("SettingsFrame #%s"):format(i);
				Size=UDim2.new(1,0,0,40);
				Position=UDim2.new(0,0,0,(i-1)*40);
				BackgroundTransparency=1;
				BorderSizePixel=0;
				BackgroundColor=BrickColor.new(SettingsData.BrickColor);
			};
			local SettingsLabel = Create("TextButton"){
				Parent=SettingsFrame;
				Name="SettingsLabel";
				Size=UDim2.new(1,0,1,0);
				TextColor3=RGB(255,255,255);
				Text=SettingsData.Text;
				Font="SourceSansBold";
				FontSize="Size18";
				BorderSizePixel=0;
				BackgroundTransparency=0;
				--BackgroundColor=BrickColor.new(NewSong.BrickColor);
				BackgroundColor3=GetRainbow(tick()/2);	
			};
			SettingsListFrame.CanvasSize=UDim2.new(0,0,0,(i-1)*40)
			--[[SettingsLabel.MouseButton1Click:connect(function()
				MakeBackGround(1234567)
			end);]]
		end
	end)
end




do
	local F = Create("Frame"){
		Name="AppContainer";
		Size=UDim2.new(0,80,0,60);
		BackgroundTransparency=1;
		BorderSizePixel=0;
		Style="DropShadow";
	};
	local Button = Create("TextButton"){
		Name="AppButton";
		Parent=F;
		Text="Overwatch";
		Font="SourceSans";
		FontSize="Size18";
		TextWrapped=true;
		BackgroundTransparency=.95;
		BorderSizePixel=0;
		TextColor3=RGB(255,255,255);
		BackgroundColor3=RGB(60,60,60);
		Size=UDim2.new(1,0,1,0);
	};
	Apps.New("Overwatch",(function()
		return F
	end)(),function()
		local asd = Create("Frame"){
			Parent=OS.Gui.Main;
			Name="OverwatchListFrame";
			Size=UDim2.new(0,400,0,400);
			Position=UDim2.new(.5,-200,.5,-200);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		local OverwatchListFrame = Create("ScrollingFrame"){
			Parent=asd;
			Name="ScrollFrame";
			Size=UDim2.new(1,0,1,0);
			BorderColor3=RGB(0,0,0);
			BackgroundColor3=RGB(25,25,25);
		};
		OS.GiveTopbar(asd,"Overwatch")
		for i = 1,#Apps.OverwatchList do
			local OverwatchData = Apps.OverwatchList[i];
			local OverwatchFrame = Create("Frame"){
				Parent=OverwatchListFrame;
				Name=("OverwatchFrame #%s"):format(i);
				Size=UDim2.new(1,0,0,40);
				Position=UDim2.new(0,0,0,(i-1)*40);
				BackgroundTransparency=1;
				BorderSizePixel=0;
				BackgroundColor=BrickColor.new(OverwatchData.BrickColor);
			};
			local OverwatchLabel = Create("TextButton"){
				Parent=OverwatchFrame;
				Name="OverwatchLabel";
				Size=UDim2.new(1,0,1,0);
				TextColor3=RGB(255,255,255);
				Text=OverwatchData.Text;
				Font="SourceSansBold";
				FontSize="Size18";
				BorderSizePixel=0;
				BackgroundTransparency=0;
				--BackgroundColor=BrickColor.new(NewSong.BrickColor);
				BackgroundColor3=GetRainbow(tick()/2);	
			};
			OverwatchListFrame.CanvasSize=UDim2.new(0,0,0,(i-1)*40)
			--[[OverwatchLabel.MouseButton1Click:connect(function()
				MakeBackGround(1234567)
			end);]]
		end
	end)
end




OS.New();
OS.Follow();






