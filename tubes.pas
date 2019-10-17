{filename: tubes.pass
Author: 1. Riksa Meidy Karim
		2. I Komang Hendra
		3. Fauzy Alfy
}


program fishbook;
uses crt;

type friend = record
	friendname: string[10];
end;

type status = record 
	owner:string[10];
	isi:string[140];
	no:integer;
	nototal: integer;
	taggedfriend: array[1..10] of string[10]; 
end;

type mystat = record
	tagged: array[1..50] of status;
	nottagged: array[1..50] of status;
end;

type user = record
	username:string[10];
	pass: string[8];
	nama: string[25];
	alamat,mail : string;
	stat: mystat;
	friendlist: array[1..99] of friend;
end;
	
type h_tag = record
	nomor: integer;
	nama_htag: string;
	isistatus: array[1..50] of status;
end;

type userray = array[1..100] of user;
type h_tagarray = array[1..100] of h_tag;

var {variabel global}
	tabuser: userray;
	hashtag: h_tagarray;
	menu,log,sign,masuk,keluar,menustatus,menuhashtag, updatebol,lihatbol,hast:boolean;
	i,idx,nostatz: integer;
	cc,a: char;
	ci: integer;
	temp:string[140];
	tempray,temprayz: array[1..10] of string;
	

procedure start(var temp:string); {mesin karakter}
begin
	ci:=1;
	cc:=temp[ci];
end;

procedure adv(var temp:string); {mesin karakter}
begin
	ci:=ci+1;
	cc:=temp[ci];
end;




procedure gambarikan(x,y:integer);
var
        i,j:integer;
begin
        gotoxy(x,y);
        for i:= 1 to 5 do begin
                if i = 1 then begin
                        for j:= 1 to 7 do begin
                                if (j= 3) or (j= 7) then write('*') else write(' ');
                                end;

                end;
                if i = 2 then begin
                        for j:= 1 to 7 do begin
                            if (j= 2) or (j=4) or (j=6) or (j=7) then write('*')
                            else write(' ');
                        end;
                end;

                if i = 3 then begin
                for j:= 1 to 7 do begin
                            if (j= 1) or (j=5) or (j=7) then write('*')
                            else write(' ');
                        end;
                end;

                if i = 4 then begin
                        for j:= 1 to 7 do begin
                            if (j= 2) or (j=4) or (j=6) or (j=7) then write('*')
                            else write(' ');
                        end;
                end;

                if i = 5 then begin
                        for j:= 1 to 7 do begin
                            if (j= 3)  or (j=7) then write('*')
                            else write(' ');
                        end;
                end;

        gotoxy(x,y+i);
        end;



end;

procedure hapusikan(x,y:integer);
var
i,j:integer;
begin;
        gotoxy(x,y);
        for i:= 1 to 5 do begin
            for j:= 1 to 7 do begin
                write(' ');
            end;
            gotoxy(x,y+i);
        end;
end;
procedure animasikan(i,j,speed:integer);

begin

        while i>0 do begin
                gambarikan(i,j);
                delay(speed);
                hapusikan(i,j);
                i:= i -10;
        end;
end;

procedure border;
var
	i:integer;
begin
		clrscr;
        gotoxy(35,1);
        write('Loading..');
        delay(1000);
        textbackground(white);
        textcolor(black);
        clrscr;
        gotoxy(1,1);
        for i:= 1 to 78 do begin write('-'); end;
        gotoxy(1,4);
        for i:= 1 to 78 do begin write('-'); end;
        gotoxy(1,18);
        for i:= 1 to 78 do begin write('-'); end;
        gotoxy(1,21);
        for i:= 1 to 78 do begin write('-'); end;

        for i:= 1 to 21 do begin gotoxy(5,i); write('|'); end;
        for i:= 1 to 21 do begin gotoxy(75,i); write('|'); end;
end;

procedure menuscreen;
begin
		border;
		gotoxy(37,2);
        write('Fishbook');
        gotoxy(20,3);
        write('A Social Networking Website for Fishermen');
        gotoxy(40,20);
        write('Copyright @ Riksa Eggy Hendra 2015');
        gambarikan(60,5);
        gotoxy(30,7);
        write('PRESS L KEY TO LOGIN');
        gambarikan(60,12);
        gotoxy(30,15);
        write('PRESS S KEY TO SIGN UP');
        
end;

procedure animasilogin(decision:char);
var
	i:integer;
begin
if decision='l' then begin
                        gotoxy(30,7);
                        for i:= 1 to 20 do write(' ');
                        delay(500);
                        animasikan(60,5,100);
                        clrscr;
                        

                end
                else if decision='s' then begin
                        gotoxy(30,15);
                        for i:= 1 to 23 do write(' ');
                        delay(500);
                        animasikan(60,12,100);
                        clrscr;
					end;
end;

procedure resetall_user(var tabuser:userray);
var
	i,j,k: integer;
begin
	for i:= 1 to 100 do begin
		tabuser[i].username:=''; {reset data pribadi}
		tabuser[i].pass:='';
		tabuser[i].nama:='';
		tabuser[i].alamat:='';
		tabuser[i].mail:='';
		for j:= 1 to 99 do begin
			tabuser[i].friendlist[j].friendname:=''; {reset friendlist}
		end;
		for j:= 1 to 50 do begin
			tabuser[i].stat.nottagged[j].owner:=''; {reset tagged status}
			tabuser[i].stat.nottagged[j].isi:='';
			tabuser[i].stat.nottagged[j].no:=0;
			tabuser[i].stat.nottagged[j].nototal:=0;
			for k:= 1 to 10 do begin	
				tabuser[i].stat.nottagged[j].taggedfriend[k]:='';
			end;
		end;
		for j:= 1 to 50 do begin
			tabuser[i].stat.tagged[j].owner:=''; {reset not tagged status}
			tabuser[i].stat.tagged[j].isi:='';
			tabuser[i].stat.tagged[j].no:=0;
			tabuser[i].stat.tagged[j].nototal:=0;
			for k:= 1 to 10 do begin	
				tabuser[i].stat.tagged[j].taggedfriend[k]:='';
			end;
		end;
			
	
	end;

end;

procedure resetallfriend(var tabuser:userray; idx:integer);
var
	j:integer;
begin
		for j:= 1 to 99 do begin
			tabuser[idx].friendlist[j].friendname:=''; {reset friendlist}
		end;
end;

procedure resetall_hashtag(var hashtag:h_tagarray);
var
	i,j,k:integer;
begin
	for i:= 1 to 100 do begin
		hashtag[i].nomor:=0;
		hashtag[i].nama_htag:='';
		for j:=1 to 50 do begin
			hashtag[i].isistatus[j].owner:='';
			hashtag[i].isistatus[j].isi:='';
			hashtag[i].isistatus[j].no:=0;
			for k:= 1 to 10 do begin
				hashtag[i].isistatus[j].taggedfriend[k]:='';
			end;
		end;
	end;	
end;



function totaluser(tabuser:userray): integer;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 100 do begin
		if tabuser[i].username<>'' then e:=e+1;
	end;
	totaluser:= e;
	

end;

function totalfriend(userx:user): integer;
var
	i,e:integer;
begin
	e:= 0;
	for i:= 1 to 99 do begin
		if userx.friendlist[i].friendname<> '' then e:=e+1;
	end;
	totalfriend:=e;

end;

function totalhashtag(hashtag:h_tagarray): integer;
var
	i,e: integer;
begin
	e:= 0;
	for i:= 1 to 100 do begin
		if hashtag[i].nomor<> 0 then e:=e+1;
	end;
	totalhashtag:=e;
end;

function totalnottagged(statx:mystat):integer;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 50 do begin
		if statx.nottagged[i].no<>0 then e:=e+1;
	end;
	totalnottagged:=e;
end;

function totaltagged(statx:mystat):integer;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 50 do begin
		if statx.tagged[i].no<>0 then e:=e+1;
	end;
	totaltagged:=e;
end;

function totalmystatus(statx:mystat):integer;
begin
	totalmystatus:= totaltagged(statx) + totalnottagged(statx);
end;

function totalhashtagstatus(hashtagx:h_tag):integer;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 50 do begin
		if hashtagx.isistatus[i].no<>0 then e:=e+1;
	end;
	totalhashtagstatus:=e;
end;

function totaltaggedfriend(statusx:status):integer;
var
	i,e :integer;
begin
	e:=0;
	for i:= 1 to 10 do begin
		if statusx.taggedfriend[i]<>'' then e:=e+1;
	end;
	totaltaggedfriend:=e;
end;

procedure bubblesort_user(var tabuser:userray);
var
        i,j,k,l: integer;
        temp: user;

begin
        for i:= 1 to 99 do begin
                for j:= 100 downto 2 do begin
                        if tabuser[j].username > tabuser[j-1].username then begin
                                temp.username:= tabuser[j-1].username;
                                temp.pass:= tabuser[j-1].pass;
                                temp.nama:= tabuser[j-1].nama;
                                temp.alamat:= tabuser[j-1].alamat;
                                temp.mail:= tabuser[j-1].mail;
								for k:= 1 to 50 do begin
									temp.stat.tagged[k].owner:= tabuser[j-1].stat.tagged[k].owner;
									temp.stat.tagged[k].isi:= tabuser[j-1].stat.tagged[k].isi;
									temp.stat.tagged[k].no:= tabuser[j-1].stat.tagged[k].no;
									temp.stat.tagged[k].nototal:= tabuser[j-1].stat.tagged[k].nototal;
									for l:= 1 to 10 do begin
									temp.stat.tagged[k].taggedfriend[l]:= tabuser[j-1].stat.tagged[k].taggedfriend[l];
									end;
									temp.stat.nottagged[k].owner:= tabuser[j-1].stat.nottagged[k].owner;
									temp.stat.nottagged[k].isi:= tabuser[j-1].stat.nottagged[k].isi;
									temp.stat.nottagged[k].no:= tabuser[j-1].stat.nottagged[k].no;
									temp.stat.nottagged[k].nototal:= tabuser[j-1].stat.nottagged[k].nototal;
									for l:= 1 to 10 do begin
									temp.stat.nottagged[k].taggedfriend[l]:= tabuser[j-1].stat.nottagged[k].taggedfriend[l];
									end;	
								end;
								for k:= 1 to 99 do begin
									temp.friendlist[k].friendname:= tabuser[j-1].friendlist[k].friendname;
								end;
								
                                tabuser[j-1].username := tabuser[j].username;
                                tabuser[j-1].pass := tabuser[j].pass;
                                tabuser[j-1].nama := tabuser[j].nama;
                                tabuser[j-1].alamat := tabuser[j].alamat;
                                tabuser[j-1].mail := tabuser[j].mail;
								for k:= 1 to 50 do begin
									tabuser[j-1].stat.tagged[k].owner:= tabuser[j].stat.tagged[k].owner;
									tabuser[j-1].stat.tagged[k].isi:= tabuser[j].stat.tagged[k].isi;
									tabuser[j-1].stat.tagged[k].no:= tabuser[j].stat.tagged[k].no;
									tabuser[j-1].stat.tagged[k].nototal:= tabuser[j].stat.tagged[k].nototal;
									for l:= 1 to 10 do begin
									tabuser[j-1].stat.tagged[k].taggedfriend[l]:= tabuser[j].stat.tagged[k].taggedfriend[l];
									end;
									tabuser[j-1].stat.nottagged[k].owner:= tabuser[j].stat.nottagged[k].owner;
									tabuser[j-1].stat.nottagged[k].isi:= tabuser[j].stat.nottagged[k].isi;
									tabuser[j-1].stat.nottagged[k].no:= tabuser[j].stat.nottagged[k].no;
									tabuser[j-1].stat.nottagged[k].nototal:= tabuser[j].stat.nottagged[k].nototal;
									for l:= 1 to 10 do begin
									tabuser[j-1].stat.nottagged[k].taggedfriend[l]:= tabuser[j].stat.nottagged[k].taggedfriend[l];
									end;	
								end;
								for k:= 1 to 99 do begin
									tabuser[j-1].friendlist[k].friendname:= tabuser[j].friendlist[k].friendname;
								end;
								
                                tabuser[j].username:= temp.username;
                                tabuser[j].pass:= temp.pass;
                                tabuser[j].nama:= temp.nama;
                                tabuser[j].mail:= temp.mail;
                                tabuser[j].alamat:= temp.alamat;
								for k:= 1 to 50 do begin
									tabuser[j].stat.tagged[k].owner:= temp.stat.tagged[k].owner;
									tabuser[j].stat.tagged[k].isi:= temp.stat.tagged[k].isi;
									tabuser[j].stat.tagged[k].no:= temp.stat.tagged[k].no;
									tabuser[j].stat.tagged[k].nototal:= temp.stat.tagged[k].nototal;
									for l:= 1 to 10 do begin
									tabuser[j].stat.tagged[k].taggedfriend[l]:= temp.stat.tagged[k].taggedfriend[l];
									end;
									tabuser[j].stat.nottagged[k].owner:= temp.stat.nottagged[k].owner;
									tabuser[j].stat.nottagged[k].isi:= temp.stat.nottagged[k].isi;
									tabuser[j].stat.nottagged[k].no:= temp.stat.nottagged[k].no;
									tabuser[j].stat.nottagged[k].nototal:= temp.stat.nottagged[k].nototal;
									for l:= 1 to 10 do begin
									tabuser[j].stat.nottagged[k].taggedfriend[l]:= temp.stat.nottagged[k].taggedfriend[l];
									end;	
								end;
								for k:= 1 to 99 do begin
									tabuser[j].friendlist[k].friendname:= temp.friendlist[k].friendname;
								end;
                        end;



                end;


        end;

end;

procedure bubblesort_friend(var userx:user);
var
i,j:integer;
temp:friend;
begin
	for i:= 1 to 98 do begin
		for j:= 99 downto 2 do begin 
			if userx.friendlist[j].friendname > userx.friendlist[j-1].friendname then begin
				temp.friendname:= userx.friendlist[j].friendname;
				userx.friendlist[j].friendname:=userx.friendlist[j-1].friendname;
				userx.friendlist[j-1].friendname:= temp.friendname;
			
			end;
		
		end;
	end;
	
	

end;

procedure bubblesort_taggedstatus(var statx:mystat);
var
		i,j,k:integer;
		temp: status;
begin
	for i:= 1 to 49 do begin
		for j:= 50 downto 2 do begin
			if (statx.tagged[j].no > statx.tagged[j-1].no) then begin
				temp.owner:= statx.tagged[j].owner;
				temp.no:= statx.tagged[j].no;
				temp.nototal:= statx.tagged[j].nototal;
				temp.isi:= statx.tagged[j].isi;
				for k:= 1 to 10 do begin
					temp.taggedfriend[k]:= statx.tagged[j].taggedfriend[k];
				end;
				
				statx.tagged[j].owner:=statx.tagged[j-1].owner;
				statx.tagged[j].no:= statx.tagged[j-1].no;
				statx.tagged[j].nototal:= statx.tagged[j-1].nototal;
				statx.tagged[j].isi:= statx.tagged[j-1].isi;
				for k:=1 to 10 do begin
					statx.tagged[j].taggedfriend[k]:= statx.tagged[j-1].taggedfriend[k];
				end;
				
				statx.tagged[j-1].owner:= temp.owner;
				statx.tagged[j-1].no:= temp.no;
				statx.tagged[j-1].nototal:= temp.nototal;
				statx.tagged[j-1].isi:=temp.isi;
				for k:= 1 to 10 do begin
					statx.tagged[j-1].taggedfriend[k]:= temp.taggedfriend[k];
				end;	
			end;
		end;
	end;
end;

procedure bubblesort_nottaggedstatus(var statx:mystat);
var
		i,j,k:integer;
		temp: status;
begin
	for i:= 1 to 49 do begin
		for j:= 50 downto 2 do begin
			if statx.nottagged[j].no > statx.nottagged[j-1].no then begin
				temp.owner:= statx.nottagged[j].owner;
				temp.no:= statx.nottagged[j].no;
				temp.nototal:= statx.nottagged[j].nototal;
				temp.isi:= statx.nottagged[j].isi;
				for k:= 1 to 10 do begin
					temp.taggedfriend[k]:= statx.nottagged[j].taggedfriend[k];
				end;
				
				statx.nottagged[j].owner:=statx.nottagged[j-1].owner;
				statx.nottagged[j].no:= statx.nottagged[j-1].no;
				statx.nottagged[j].nototal:= statx.nottagged[j-1].nototal;
				statx.nottagged[j].isi:= statx.nottagged[j-1].isi;
				for k:=1 to 10 do begin
					statx.nottagged[j].taggedfriend[k]:= statx.nottagged[j-1].taggedfriend[k];
				end;
				
				statx.nottagged[j-1].owner:= temp.owner;
				statx.nottagged[j-1].no:= temp.no;
				statx.nottagged[j-1].nototal:= temp.nototal;
				statx.nottagged[j-1].isi:=temp.isi;
				for k:= 1 to 10 do begin
					statx.nottagged[j-1].taggedfriend[k]:= temp.taggedfriend[k];
				end;	
			end;
		end;
	end;
end;

procedure bubblesort_hashtag(var hashtag:h_tagarray);
var
	i,j,k,l:integer;
	temp:h_tag;
begin
	for i:= 1 to 99 do begin
		for j:= 100 downto 2 do begin
			if hashtag[j].nomor > hashtag[j-1].nomor then begin
			
						temp.nomor:= hashtag[j].nomor;
						temp.nama_htag:= hashtag[j].nama_htag;
						for k:= 1 to 50 do begin
							temp.isistatus[k].owner:= hashtag[j].isistatus[k].owner;
							temp.isistatus[k].no:= hashtag[j].isistatus[k].no;
							temp.isistatus[k].isi:= hashtag[j].isistatus[k].isi;
							for l:= 1 to 10 do begin
								temp.isistatus[k].taggedfriend[l]:= hashtag[j].isistatus[k].taggedfriend[l];
							end;	
						end;
						
						hashtag[j].nomor:= hashtag[j-1].nomor;
						hashtag[j].nama_htag:= hashtag[j-1].nama_htag;
						for k:= 1 to 50 do begin
							hashtag[j].isistatus[k].owner:= hashtag[j-1].isistatus[k].owner;
							hashtag[j].isistatus[k].no:= hashtag[j-1].isistatus[k].no;
							hashtag[j].isistatus[k].isi:= hashtag[j-1].isistatus[k].isi;
							for l:= 1 to 10 do begin
								hashtag[j].isistatus[k].taggedfriend[l]:= hashtag[j-1].isistatus[k].taggedfriend[l];
							end;
						end;
						
						hashtag[j-1].nomor:= temp.nomor;
						hashtag[j-1].nama_htag:= temp.nama_htag;
						for k:= 1 to 50 do begin
							hashtag[j-1].isistatus[k].owner:= temp.isistatus[k].owner;
							hashtag[j-1].isistatus[k].no:= temp.isistatus[k].no;
							hashtag[j-1].isistatus[k].isi:= temp.isistatus[k].isi;
							for l:= 1 to 10 do begin
								hashtag[j-1].isistatus[k].taggedfriend[l]:= temp.isistatus[k].taggedfriend[l];
							end;
						end;
			end;
		end;
	end;

end;

procedure bubblesort_hashtagstatus(var hashtagx:h_tag);
var
	i,j,k:integer;
	temp: status;
	
begin
		for i:= 1 to 49 do begin
			for j:= 50 downto 2 do begin
				if hashtagx.isistatus[j].no > hashtagx.isistatus[j-1].no then begin
					temp.no:= hashtagx.isistatus[j].no;
					temp.owner:= hashtagx.isistatus[j].owner;
					temp.isi:= hashtagx.isistatus[j].isi;
					for k:= 1 to 10 do begin
						temp.taggedfriend[k]:= hashtagx.isistatus[j].taggedfriend[k];
					end;
					hashtagx.isistatus[j].no:= hashtagx.isistatus[j-1].no;
					hashtagx.isistatus[j].owner:= hashtagx.isistatus[j-1].owner;
					hashtagx.isistatus[j].isi:= hashtagx.isistatus[j-1].isi;
					for k:= 1 to 10 do begin
						hashtagx.isistatus[j].taggedfriend[k]:= hashtagx.isistatus[j-1].taggedfriend[k];
					end;
					
					hashtagx.isistatus[j-1].no:= temp.no;
					hashtagx.isistatus[j-1].owner:= temp.owner;
					hashtagx.isistatus[j-1].isi:= temp.isi;
					for k:= 1 to 10 do begin
						hashtagx.isistatus[j-1].taggedfriend[k]:= temp.taggedfriend[k];
					end;
					
					
				end;
			end;
		end;


end;

procedure bubblesort_taggedfriend(var statusx:status);
var
	i,j:integer;
	temp:string;
begin
	for i:= 1 to 9 do begin
		for j:= 10 downto 2 do begin
			if statusx.taggedfriend[j] > statusx.taggedfriend[j-1] then begin
					temp:= statusx.taggedfriend[j];
					statusx.taggedfriend[j]:= statusx.taggedfriend[j-1];
					statusx.taggedfriend[j-1]:= temp;			
			end;
		end;
	end;
end;

function searchusername(tabuser:userray;x:string):boolean;
var
i,e:integer;
begin
	e:=0;
	for i:= 1 to 100 do begin
		if x=tabuser[i].username then e:=e+1; 
	end;
	if e=0 then searchusername:=false else searchusername:=true;
end;

function loginsearch(tabuser:userray;username,pass:string):boolean;
var
        i,e:integer;
begin
        e:=0;
        for  i:= 1 to 100 do begin
            if (tabuser[i].username= username) and (tabuser[i].pass= pass)
            then e:=e+1;

        end;
        if e=0 then loginsearch:=false else loginsearch:=true;
end;

function idx_usernamesearch(tabuser:userray;username:string):integer;
var
	i:integer;
begin
	
	for i:= 1 to 100 do begin
		if username = tabuser[i].username then idx_usernamesearch:= i; 
	end;
end;


procedure assignalluserasfriend(var tabuser:userray; var idx: integer);
var
	i:integer;
begin
	bubblesort_user(tabuser);
	
	for i:= 1 to totaluser(tabuser) do begin
		if (tabuser[i].username <> tabuser[idx].username) then 
		tabuser[idx].friendlist[i].friendname:= tabuser[i].username;
	end;
end;

procedure assigndefaultuser(var tabuser:userray);
begin
	tabuser[1].username:='riksa';  {assign data pribadi Riksa}
	tabuser[1].pass:='calm';
	tabuser[1].nama:='Riksa Meidy Karim';
	tabuser[1].alamat:='Cianjur';
	tabuser[1].mail:='riksameidy@gmail.com';

	
	
	
	tabuser[2].username:='hendra';  {assign data pribadi hendra}
	tabuser[2].pass:='komang';
	tabuser[2].nama:='I Komang Hendra';
	tabuser[2].alamat:='Sulawesi';
	tabuser[2].mail:='hendra@gmail.com';
	
	
	tabuser[3].username:='eggy';  {assign data pribadi eggy}
	tabuser[3].pass:='dota2';
	tabuser[3].nama:='Fauzy Alfy';
	tabuser[3].alamat:='Jawa';
	tabuser[3].mail:='eggy@gmail.com';
		
end;

procedure menureturn(var menu,log,sign:boolean);
var 
	dec: char;
begin 
	menuscreen;
	menu:=true;
	while menu= true do begin
		dec:=readkey;
		animasilogin(dec);
		if (dec = 'l') or (dec='s') then menu:=false
		else menu:=true;
	end;
	if dec='s' then sign:=true else if dec='l' then log:=true else if dec='z' then keluar:=true;
end;

procedure signupscreen(var menu,log,sign:boolean; var tabuser:userray);
var
        temp: user;
        deci: char;
        e,idx:integer;
begin
        while sign=true do begin
                writeln('Silahkan Masukkan Data Berikut Untuk Mendaftar: ');
                write('Username: '); readln(temp.username);
                write('Nama: '); readln(temp.nama);
                write('Password: '); readln(temp.pass);
                write('Alamat Email: '); readln(temp.mail);
                write('Alamat: ');readln(temp.alamat);
                writeln; writeln;
                writeln('Tekan tombol Y untuk submit data atau N untuk membatalkan');
                deci:=readkey;
                if deci='n' then begin
                   writeln('Apakah ingin kembali ke menu atau mengulangi sign up?');
                   writeln('U (mengulang sign up) ---- B (kembali ke menu)');
                   deci:= readkey;
                   if deci = 'b' then begin 
				   sign:=false; 
				   menu:=true; 
				   menureturn(menu,log,sign);
					end; 
				end
				else if (deci='y') and (searchusername(tabuser,temp.username)=true) then begin
					writeln('Username sudah Digunakan'); delay(500);
				end
                else if (deci='y') and (searchusername(tabuser,temp.username)=false)then begin
                        bubblesort_user(tabuser);
                        e:=totaluser(tabuser);
						idx:= e+1;
                        tabuser[idx].username:= temp.username;
                        tabuser[idx].pass:= temp.pass;
                        tabuser[idx].nama:= temp.nama;
                        tabuser[idx].alamat:= temp.alamat;
                        tabuser[idx].mail:= temp.mail;
						bubblesort_user(tabuser);
                        writeln;
                        writeln('Sign Up Berhasil'); 
						write('Anda sudah dapat Login');
						delay(1000);
                        sign:=false; 
						menu:=true; 
						menureturn(menu,log,sign);
                end;
		end;
end;

procedure loginscreen(var menu,log,sign,masuk:boolean;var tabuser:userray;var idx:integer);
var
username,pass:string;
dec:char;
n:integer;
begin 
		
        while log=true do begin
			n:=1;
			while n<= 3 do begin
                write('Username: '); readln(username);
                write('Password: '); readln(pass);
                if (loginsearch(tabuser,username,pass)= true) then begin
					writeln('login Berhasil');
					clrscr;
					idx:= idx_usernamesearch(tabuser,username);
					resetallfriend(tabuser,idx);
					assignalluserasfriend(tabuser,idx);
					writeln('Selamat Datang ',username); delay(500);
					log:=false;
					n:=4;
					masuk:= true;
				end
				
                else begin writeln('Password Atau Username Salah');
					n:=n+1;
					if n=4 then begin 
						write('Gagal 3 Kali'); delay(1000);clrscr;
						write('Sayonara~');delay(1000);
						halt;
						
					end 
					else begin
						writeln('Tekan Tombol Y untuk mengulangi atau tombol N untuk kembali ke menu');
						dec:=readkey;
						if dec= 'n' then begin 
						n:=4;
						log:=false; menureturn(menu,log,sign);
						end;
					end;
				end;
                writeln;
			end;
        end;
			
end;



procedure homepagescreen(var idx:integer;var masuk:boolean; var tabuser:userray; var menustatus,menuhashtag:boolean);
var 
		i:integer;
		dec:char;
begin
	
	textbackground(black);
	textcolor(yellow);
	clrscr;
	gotoxy(1,1);
	for i:= 1 to 78 do begin write('='); end;
	gotoxy(1,3);
	for i:= 1 to 78 do begin write('='); end;
	
	for i:= 1 to 25 do begin 
		gotoxy(17,i);
		write('||');
	end;
	gotoxy(4,2); write('FRIENDLIST');
	gotoxy(34,2); write(tabuser[idx].nama);
	gotoxy(1,5); 
	bubblesort_friend(tabuser[idx]);
	for i:= 1 to totalfriend(tabuser[idx]) do begin
		writeln(i,'. ',tabuser[idx].friendlist[i].friendname);
	end;
	gotoxy(20,5);
	write('1. Tekan s untuk menuju MY STATUS');
	gotoxy(20,6);
	write('2. Tekan h untuk menuju MENU HASHTAG');
	gotoxy(20,7);
	write('3. Tekan l untuk LOGOUT');
	dec:=readkey;
	case dec of
		's': begin
				menustatus:=true; menuhashtag:=false;
			end;
		'h': begin
				menustatus:=false;menuhashtag:=true;hast:=true;
			end;
		'l' : begin
				menustatus:=false;menuhashtag:=false;masuk:=false;menureturn(menu,log,sign);
			end;
			
			
			
			

end;
	
	
end;

procedure templatestatusnottagged(y:integer; tabuser:userray;idx: integer;var nostat:integer);
var
	i : integer;
begin
	case y of
		2: begin
			y:=y+6;
			end;
		3: begin
			y:=y+15;
			end;
	end;
	
	textcolor(yellow);
	gotoxy(1,y);
	write('No: ',tabuser[idx].stat.nottagged[nostat].nototal);
	gotoxy(1,y+2);
	write(tabuser[idx].stat.nottagged[nostat].isi);
	gotoxy(8,y);
	write(tabuser[idx].username,'|');
	gotoxy(1,y+1);
	for i:= 1 to 78 do begin
		write('=');
	end;
	gotoxy(1,y+6);
	for i:= 1 to 78 do begin
		write('=');
	
	end;
end;

procedure templatestatustagged(y:integer; tabuser:userray;idx: integer;nostat:integer);
var
	i : integer;
begin
	case y of
		2: begin
			y:=y+6;
			end;
		3: begin
			y:=y+15;
			end;
	end;
	
	textcolor(yellow);
	gotoxy(1,y);
	write('No: ',tabuser[idx].stat.tagged[nostat].nototal);
	gotoxy(1,y+2);
	write(tabuser[idx].stat.tagged[nostat].isi);
	gotoxy(8,y);
	write(tabuser[idx].username,'|');
	gotoxy(24,y);
	write('| Tagged From: ', tabuser[idx].stat.tagged[nostat].owner);
	gotoxy(1,y+1);
	for i:= 1 to 78 do begin
		write('=');
	end;
	gotoxy(1,y+6);
	for i:= 1 to 78 do begin
		write('=');
	
	end;
	
end;



procedure ignoreblank(temp:string);
begin
	if cc = ' ' then adv(temp);

end;

procedure bubblesort_tempray(var tempray:array of string);
var
	i,j: integer;
	tempe:string;
begin
	for i:= 1 to 10 do begin
		for j:= 10 downto 2 do begin
			if tempray[j] > tempray[j-1] then begin
				tempe:= tempray[j];
				tempray[j]:=tempray[j-1];
				tempray[j-1]:= tempe;
			end;
		
		end;
	end;
end;

function ambilhashtag(temp:string):string;
begin
	start(temp);
	ambilhashtag:='';
	while cc<>'.' do begin
		if (cc = '#') and (ci=1) then  begin
				while (cc<>' ') do begin
					if cc = '#' then adv(temp) else 
						begin
							ambilhashtag:= ambilhashtag + cc;
							adv(temp);
						end;
				end;
			end
		else
			adv(temp);	
	end;

end;

function cekjumlahtag(temp:string):integer;
begin
	start(temp);
	cekjumlahtag:= 0;
	while cc<>'.' do begin
		ignoreblank(temp);
		if cc='@' then begin
			ignoreblank(temp);
			while (cc <>' ') and (cc<>'.') do begin
				if cc='@' then adv(temp)
				else begin
					if (cc= ' ') or (cc='.') then cekjumlahtag:=cekjumlahtag+1;
					adv(temp);
				end;
			end;
		end
		else adv(temp);
	end;
end;

function jumlahfix_tempray(tempray:array of string):integer;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 9 do begin
		if tempray[i]<>'' then e:=e+1;
	end;
	jumlahfix_tempray:= e;
end;


procedure ambiltag(temp:string;var tempray:array of string);
var
	n,i,j :integer;
begin
	n:=cekjumlahtag(temp);
	start(temp);
	i:=0; 
	
	
	while cc<>'.' do begin
		ignoreblank(temp);
		if cc='@' then begin
			i:=i+1;
			while (cc<>' ') and (cc <>'.') do begin
				if cc='@' then adv(temp)
				else 
					begin
						if cc<>'.' then tempray[i]:= tempray[i] + cc;
						adv(temp);
					end;
			end;
			
		end
		
		else adv(temp);
	end;	
end;

procedure updatestatustemplate;
var
	i: integer;
begin
	gotoxy(1,1);
	for i:=1 to 78 do write('=');
	gotoxy(1,5);
	for i:= 1 to 78 do write('=');
	gotoxy(1,6);
	write('TEKAN ENTER UNTUK UPDATE STATUS');
	gotoxy(1,7);
	for i:= 1 to 78 do write('=');


end;

procedure updatestatussementara(var temp:string);

begin
	gotoxy(1,2);
	readln(temp);
	
	
end;

procedure assignnomorstatussementara(var notemp,nototaltemp:integer;var tabuser:userray;idx:integer);
begin
	notemp:= totalnottagged(tabuser[idx].stat) + 1;
	nototaltemp:= totalmystatus(tabuser[idx].stat)+1;	
end;

procedure previewstatus(var temp:string;var tempray: array of string; notemp,idx:integer;tabuser:userray);
var
	i:integer;
	n:integer;
	statustampil: string;
begin
		gotoxy(1,9);
		write('PREVIEW:');
		gotoxy(1,10);
		for i:= 1 to 78 do write('=');
		gotoxy(1,11);
		write('No: ',notemp,'|');
		gotoxy(8,11);
		write(tabuser[idx].username);
		gotoxy(1,12);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,13);
		{penampilan status}
		start(temp);
		statustampil:='';
		while cc<>'.' do begin
			statustampil:= statustampil+cc;
			adv(temp);
		end;
		write(statustampil);
		gotoxy(1,17);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,18);
		write('Tagged:');
		bubblesort_tempray(tempray);
		n:=jumlahfix_tempray(tempray);
		for i:= 1 to n do begin
			write(tempray[i],',');
		end;
		gotoxy(1,20);
		write('Hashtag: ');
		gotoxy(25,21);
		write('Tekan Y untuk submit status atau N untuk membatalkan');
end;

function jumlahtaggedsama(searchx:string;tempray:array of string):integer;
var
	n,i:integer;
begin
	n:=0;
	for i:= 1 to 10 do begin
		if searchx = tempray[i] then n:=n+1;
	end;
	jumlahtaggedsama:=n;
end;

function idxtaggedstatus(searchx:string;tempray:array of string):integer;
var
	i:integer;
begin
	i:=1;
	while searchx <> tempray[i] do begin
				i:=i+1;
	end;
	idxtaggedstatus:= i;
end;



procedure tagjadisatu(var tempray:array of string;temp:string);
var
	i,j: integer;
	awal,akhir:integer;
begin
	
	bubblesort_tempray(tempray);
	for i:= 1 to 10 do begin
		if (jumlahtaggedsama(tempray[i],tempray) > 1) and (tempray[i]<>'') then 
			begin
				awal:=  idxtaggedstatus(tempray[i],tempray)+1;
				akhir:= idxtaggedstatus(tempray[i],tempray)+ jumlahtaggedsama(tempray[i],tempray) -1;
				for j:= awal to akhir do begin
					tempray[j]:='';
				end;
				
			end;
			
	end;
	
end;

function cektag(k:string;tabuser: userray;idx:integer):boolean;
var
	j,n:integer;
begin
	n:=0;
	for j:= 1 to 99 do begin
		if k = tabuser[idx].friendlist[j].friendname then n:=n+1;
	end;
	if n=1 then cektag:= true else cektag:=false;
end;

procedure fixintempray(var tempray:array of string; tabuser: userray; idx:integer);
var
		temporary: array[1..10] of string;
		i,j:integer;
		k:string;
begin
		bubblesort_tempray(tempray);
		j:=0;
		for i:= 1 to 10 do begin
			k:=tempray[i];
			if (cektag(k,tabuser,idx)=true) and (k<>'') then
				begin
					j:=j+1;
					temporary[j]:= k;
				end;
		
		end;
		for i:= 1 to 10 do begin
			tempray[i]:='';
		end;
		i:= 1;
		while i<=j do begin
			tempray[i]:= temporary[i];
			i:=i+1;
			
		end;
		
		
		
		
end;

function cekhashtag(searchx: string; hashtag: h_tagarray):boolean;
var
	i,e:integer;
begin
	e:=0;
	for i:= 1 to 100 do begin 
		if searchx = hashtag[i].nama_htag then e:=e+1;
	end;
	if e=0 then cekhashtag:=false else cekhashtag:=true;
end;

function searchnohashtag(searchx:string; hashtag:h_tagarray):integer;
var
	i,e: integer;
begin
		e:= 0;
		for i:= 1 to 100 do begin
			if searchx = hashtag[i].nama_htag then e:=i;
		end;
		searchnohashtag:= e;
end;

function searchhashtagbystat(searchx:string; hashtag:h_tagarray):string;
var
	j,i,e: integer;
begin
		e:= 0;
		for i:= 1 to 100 do begin
			for j:= 1 to 50 do begin
			if searchx = hashtag[i].isistatus[j].isi then e:=i;
		end;
		end;
		searchhashtagbystat:= hashtag[e].nama_htag;
end;

procedure assignnomorhashtagsementara(hashtagx:string; hashtag:h_tagarray; var nohashtag:integer);
begin
	bubblesort_hashtag(hashtag);
	if cekhashtag(hashtagx,hashtag) = true then 
		begin
		nohashtag:= searchnohashtag(hashtagx,hashtag);	
		end
	else if cekhashtag(hashtagx,hashtag) = false then 
		begin
			nohashtag:= totalhashtag(hashtag)+1;
		end;
end;

procedure assignnomorhashtagstatussementara(hashtag:h_tagarray; nohashtag:integer; var nostatushashtag:integer);
begin
	nostatushashtag:= totalhashtagstatus(hashtag[nohashtag]) + 1;
end;


procedure assignstatustoself(temp:string;notemp,nototaltemp:integer; var tabuser:userray;idx:integer);
begin
		tabuser[idx].stat.nottagged[notemp].owner:= tabuser[idx].username;
		tabuser[idx].stat.nottagged[notemp].no:= notemp;
		tabuser[idx].stat.nottagged[notemp].nototal:= nototaltemp;
		tabuser[idx].stat.nottagged[notemp].isi:= temp;
end;


procedure assigntagself(tempray:array of string;notemp:integer; var tabuser:userray);
var
	i:integer;
begin

		for i:= 1 to jumlahfix_tempray(tempray) do begin
			tabuser[idx].stat.nottagged[notemp].taggedfriend[i]:= tempray[i];
		end;		
end;


procedure assignstatustotagged(temp:string;tempray:array of string;var tabuser:userray);
var
	i,j,idxuser,nostatuser,nototalstatuser:integer;
begin
	
	for i:= 1 to jumlahfix_tempray(tempray) do begin
		idxuser:=idx_usernamesearch(tabuser,tempray[i]);
		nostatuser:= totaltagged(tabuser[idxuser].stat)+1;
		nototalstatuser:= totalmystatus(tabuser[idxuser].stat)+1;
		
		tabuser[idxuser].stat.tagged[nostatuser].owner:= tabuser[idx].username;
		tabuser[idxuser].stat.tagged[nostatuser].no:= nostatuser;
		tabuser[idxuser].stat.tagged[nostatuser].nototal:= nototalstatuser;
		tabuser[idxuser].stat.tagged[nostatuser].isi:= temp;
		
		bubblesort_tempray(tempray);
		for j:=1 to jumlahfix_tempray(tempray) do begin
			tabuser[idxuser].stat.tagged[nostatuser].taggedfriend[j]:= tempray[j];
		end;	
	end;
		
end;

procedure assignhashtag(var hashtag:h_tagarray;hashtagx:string; nohashtag,nostatushashtag:integer; temp:string; tempray: array of string);
var
		i:integer;
begin
		hashtag[nohashtag].nomor:= nohashtag;
		hashtag[nohashtag].nama_htag:= hashtagx;
		hashtag[nohashtag].isistatus[nostatushashtag].owner:= tabuser[idx].username;
		hashtag[nohashtag].isistatus[nostatushashtag].no:= nostatushashtag;
		hashtag[nohashtag].isistatus[nostatushashtag].isi:= temp;

		bubblesort_tempray(tempray);
		for i:= 1 to jumlahfix_tempray(tempray) do begin
			hashtag[nohashtag].isistatus[nostatushashtag].taggedfriend[i]:= tempray[i];
		end;	
	
end;

procedure menustatusscreen(var tabuser:userray; var idx:integer; var hashtag:h_tagarray; var menustatus,menuhashtag,updatebol,lihatbol:boolean);
var
dec:char;	
begin
	
		clrscr;
		gotoxy(1,11);
		writeln('1. Tekan u untuk update status');
		writeln('2. Tekan l untuk lihat semua status');
		writeln('3. Tekan b untuk kembali ke hompage');
		dec:=readkey;
		case dec of
		'u': begin
				updatebol:=true;lihatbol:=false;
			end;
		'l': begin
				updatebol:=false;lihatbol:=true;
			end;
			
		'b': begin
				menustatus:=false;
			end;
		
		end;
	


end;

procedure updatestatus(var tabuser: userray; var idx:integer;var hashtag:h_tagarray; var temp:string;var tempray:array of string; var updatebol,lihatbol:boolean);

var
	notemp,nototaltemp,nohashtag,nostatushashtag: integer;
	hashtagx: string;
	i: integer;
	dec: char;
	
	
begin
while updatebol=true do begin
	for i:= 1 to 10 do begin
		tempray[i]:='';
	end;
	updatestatustemplate;
	updatestatussementara(temp);
	hashtagx:= ambilhashtag(temp);
	assignnomorstatussementara(notemp,nototaltemp,tabuser,idx);
	assignnomorhashtagsementara(hashtagx,hashtag,nohashtag);
	assignnomorhashtagstatussementara(hashtag,nohashtag,nostatushashtag);
	ambiltag(temp,tempray);
	tagjadisatu(tempray,temp);
	fixintempray(tempray,tabuser,idx);
	previewstatus(temp,tempray,notemp,idx,tabuser);
	gotoxy(10,20);
	write(hashtagx);
	dec:=readkey;
	case dec of
		'y': begin
			assignstatustoself(temp,notemp,nototaltemp,tabuser,idx);
			assigntagself(tempray,notemp,tabuser);
			assignstatustotagged(temp,tempray,tabuser);
			assignhashtag(hashtag,hashtagx,nohashtag,nostatushashtag,temp,tempray);
			updatebol:=false;
			clrscr;
			end;
		'n': begin
				clrscr;
				updatebol:=false;
			
			
			end;
		
	end;
end;

end;

function searchidxfromnototalnottagged(x:integer;tabuser:userray;idx:integer):integer;
var 
	e,i:integer;
begin
		e:=0;
		for i:= 1 to 50 do begin
			if x= tabuser[idx].stat.nottagged[i].nototal then e:=i;
		end;
		
		
		searchidxfromnototalnottagged:=e;
		
end;

function searchidxfromnototaltagged(x:integer;tabuser:userray;idx:integer):integer;
var 
	e,i:integer;
begin
		e:=0;
		for i:= 1 to 50 do begin
			if x= tabuser[idx].stat.tagged[i].nototal then e:=i;
		end;
		
		
		searchidxfromnototaltagged:=e;
		
end;

function searchcategoryfromnototal(x:integer;tabuser:userray;idx:integer):boolean;
var 
	e,i:integer;
begin
		e:=0;
		for i:= 1 to 50 do begin
			if x= tabuser[idx].stat.nottagged[i].nototal then e:=e+1;	
		end;
		if e> 0 then searchcategoryfromnototal:=true else searchcategoryfromnototal:=false;
end;

function searchnomorstatusfromotheruser(tabuser:userray;idx,idxt,nostatz:integer):integer;
var
		numbe,i,e:integer;
begin
	
	for i:= 1 to 50 do begin
		numbe:= searchidxfromnototaltagged(i,tabuser,idx);
		if tabuser[idx].stat.tagged[numbe].isi = tabuser[idxt].stat.nottagged[i].isi then e:=i;
	end;
	searchnomorstatusfromotheruser:=e; 
	
end;


procedure hapusstatususer(var tabuser:userray; idx,nostatz:integer; var temprayz: array of string);
var
i,j,tot,numbe,e :integer;
begin
	
	numbe:= searchidxfromnototalnottagged(nostatz,tabuser,idx);
	for i:= 1 to 10 do begin
		temprayz[i]:='';	
	end;
	e:= totaltaggedfriend(tabuser[idx].stat.nottagged[numbe]);
	for i:= 1 to e do begin
		temprayz[i]:= tabuser[idx].stat.nottagged[numbe].taggedfriend[i];
	end;
	
{hapus + sortlagi self}
	
	tabuser[idx].stat.nottagged[numbe].owner:='';
	tabuser[idx].stat.nottagged[numbe].no:=0;
	tabuser[idx].stat.nottagged[numbe].nototal:=0;
	tabuser[idx].stat.nottagged[numbe].isi:='';
	for i:= 1 to totaltaggedfriend(tabuser[idx].stat.nottagged[numbe]) do begin
		tabuser[idx].stat.nottagged[numbe].taggedfriend[i]:='';
	end;
	
	i:= nostatz;
	tot:= totalmystatus(tabuser[idx].stat);
	bubblesort_nottaggedstatus(tabuser[idx].stat);
	
	while i<= tot do begin
		i:=i+1;
		if searchcategoryfromnototal(i,tabuser,idx)= true then begin
		numbe:= searchidxfromnototalnottagged(i,tabuser,idx)+1;
		tabuser[idx].stat.nottagged[i-1].owner:= tabuser[idx].stat.nottagged[i].owner;
		tabuser[idx].stat.nottagged[i-1].nototal:= tabuser[idx].stat.nottagged[i].nototal;
		tabuser[idx].stat.nottagged[numbe-1].no:= tabuser[idx].stat.nottagged[numbe].no;
		tabuser[idx].stat.nottagged[numbe-1].isi:= tabuser[idx].stat.nottagged[numbe].isi;
		for j:= 1 to 10 do begin
			tabuser[idx].stat.nottagged[numbe-1].taggedfriend[j]:= tabuser[idx].stat.nottagged[numbe].taggedfriend[j];
		end;
		
		end
		
	else begin
		numbe:= searchidxfromnototaltagged(i,tabuser,idx)+1;
		tabuser[idx].stat.tagged[i-1].owner:= tabuser[idx].stat.tagged[i].owner;
		tabuser[idx].stat.tagged[i-1].nototal:= tabuser[idx].stat.tagged[i].nototal;
		tabuser[idx].stat.tagged[numbe-1].no:= tabuser[idx].stat.tagged[numbe].no;
		tabuser[idx].stat.tagged[numbe-1].isi:= tabuser[idx].stat.tagged[numbe].isi;
		for j:= 1 to 10 do begin
			tabuser[idx].stat.tagged[numbe-1].taggedfriend[j]:= tabuser[idx].stat.tagged[numbe].taggedfriend[j];
		end;
		
		
		end;
		
		
	end;
end;

procedure hapusstatusothers(var tabuser:userray;idx,nostatz:integer; var temprayz: array of string);
var
i,idxt,ntarget:integer;
targets: string;

begin
	i:=1;
	bubblesort_tempray(temprayz);
	while tempray[i]<>'' do begin
		targets:= tempray[i];
		idxt:= idx_usernamesearch(tabuser,targets);
		ntarget:= searchnomorstatusfromotheruser(tabuser,idx,idxt,nostatz);
		hapusstatususer(tabuser,idxt,ntarget,tempray);
		bubblesort_tempray(tempray);
		i:=i+1;
	end;
	

end;

procedure editstatus(var nostatz:integer; var statbaru:string);
begin
	clrscr;
	writeln('Masukkan status yg baru');
	readln(statbaru);


end;

procedure lihatstatusdetailnottagged(var tabuser:userray;hashtag:h_tagarray;idx,nostatz:integer);
var
	numbe:integer;
	nhashtag, statbaru:string;
	dec:char;
begin
		numbe:= searchidxfromnototalnottagged(nostatz,tabuser,idx);
		gotoxy(1,10);
		for i:= 1 to 78 do write('=');
		gotoxy(1,11);
		write('No: ',nostatz,'|');
		gotoxy(8,11);
		write(tabuser[idx].username);
		gotoxy(1,12);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,13);
		{penampilan status}
		
		write(tabuser[idx].stat.nottagged[numbe].isi);
		gotoxy(1,17);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,18);
		for i:= 1 to totaltaggedfriend(tabuser[idx].stat.nottagged[numbe]) do begin
		write('Tagged: ',tabuser[idx].stat.nottagged[numbe].taggedfriend[i],' ');
		end;
		gotoxy(1,20);
		nhashtag:= searchhashtagbystat(tabuser[idx].stat.nottagged[numbe].isi,hashtag);
		write('Hashtag: ',nhashtag);
		gotoxy(25,21);
		write('Tekan e untuk edit status');
		dec:=readkey;
		case dec of
			'b': begin 
					lihatbol:=false;
					menustatus:=false;
				end;
			'e': begin
				editstatus(nostatz,statbaru);
			
			end;

		end;
end;

procedure lihatstatusdetailtagged(var tabuser:userray;hashtag:h_tagarray;idx,nostatz:integer);
var
	numbe:integer;
	nhashtag, stattampil:string;
	dec:char;
begin
		numbe:= searchidxfromnototaltagged(nostatz,tabuser,idx);
		gotoxy(1,10);
		for i:= 1 to 78 do write('=');
		gotoxy(1,11);
		write('No: ',nostatz,'|');
		gotoxy(8,11);
		write(tabuser[idx].username);
		gotoxy(1,12);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,13);
		{penampilan status}
		write(tabuser[idx].stat.tagged[numbe].isi);
		gotoxy(1,17);
		for i:= 1 to 78 do  write('=');
		gotoxy(1,18);
		for i:= 1 to totaltaggedfriend(tabuser[idx].stat.tagged[numbe]) do begin
		write('Tagged: ',tabuser[idx].stat.tagged[numbe].taggedfriend[i],' ');
		end;
		gotoxy(1,20);
		nhashtag:= searchhashtagbystat(tabuser[idx].stat.nottagged[numbe].isi,hashtag);
		write('Hashtag: ',nhashtag);
		gotoxy(25,21);
		write('Tekan b untuk kembali');
		dec:=readkey;
			
end;

procedure pilihstatus(var nostatz:integer;idx:integer;var tabuser:userray;hashtag:h_tagarray);
begin
	clrscr;
	writeln('Pilih Status nomor berapa?');
	readln(nostatz);
	if nostatz <= totalmystatus(tabuser[idx].stat) then begin
	
	if searchcategoryfromnototal(nostatz,tabuser,idx)= true then 
		lihatstatusdetailnottagged(tabuser,hashtag,idx,nostatz)					
	else 
		lihatstatusdetailtagged(tabuser,hashtag,idx,nostatz);

	end
	else
		write('Status Tidak ada'); delay(500);
end;

procedure showstatuspage(n:integer;var tabuser:userray;idx:integer);
var
i,tot,k,y,j,numbe,pagetot:integer;
page: array[1..34,1..3] of integer;

begin
tot:= totalmystatus(tabuser[idx].stat);
if tot mod 3 =0 then pagetot:= (tot div 3) else pagetot:= (tot div 3) + 1;

k:=tot;
for i:= 1 to pagetot do begin
		for j:= 1 to 3 do begin
			if k>0 then 
			begin
				page[i,j]:= k;
				k:=k-1;
			end
			else page[i,j]:=0;
		end;
end;
k:=1;
for i:= page[n,1] downto page[n,3] do begin
			if i>0 then begin
			y:= k;
			k:=k+1;
			j:=i;
			if searchcategoryfromnototal(j,tabuser,idx)= true then begin
				numbe:= searchidxfromnototalnottagged(j,tabuser,idx);
				if numbe<>0 then templatestatusnottagged(y,tabuser,idx,numbe);
				end
			else begin
				numbe:=searchidxfromnototaltagged(j,tabuser,idx);
				if numbe<> 0 then templatestatustagged(y,tabuser,idx,numbe);
				end;
			end;
			
		end;
end;

procedure lihatstatusscreen(var tabuser:userray;idx:integer;var updatebol,lihatbol:boolean);
var 
n,k,l,nohapus: integer;
dec:char;


begin
	
	while lihatbol=true do begin
		k:= totalmystatus(tabuser[idx].stat);
		if k mod 3 =0 then l:= (k div 3) else l:= (k div 3) + 1;
		n:=1;
		clrscr;
		showstatuspage(n,tabuser,idx);
		if (n>1) and (n<=l)  then begin
			gotoxy(1,25);
			write('press b to go back,m to go next page, n to go back, h untuk hapus status, l untuk lihat status');
			dec:=readkey;
			case dec of
				'b' : lihatbol:=false;
				'm' : n:=n+1;
				'n' : n:=n-1;
				'l' : pilihstatus(nostatz,idx,tabuser,hashtag);
				'h'	: begin 
						clrscr;
						write('Nomor yang akan dihapus: ');
						readln(nohapus);
						hapusstatususer(tabuser,idx,nohapus,temprayz);
						hapusstatusothers(tabuser,idx,nohapus,temprayz);
					end;
			end;
		end
		else if (n=1) and (n<>l) then begin
			gotoxy(1,25);
			write('press b to go back,m to go next page,  h untuk hapus status, l untuk lihat status');
			dec:=readkey;
			case dec of
				'b' : lihatbol:=false;
				'm' : n:=n+1;
				'l' : pilihstatus(nostatz,idx,tabuser,hashtag);
				'h'	: begin 
						clrscr;
						write('Nomor yang akan dihapus: ');
						readln(nohapus);
						hapusstatususer(tabuser,idx,nohapus,temprayz);
						hapusstatusothers(tabuser,idx,nohapus,temprayz);
					end;
			end;
		end
		else if (n=1) and (n=l) then begin
			gotoxy(1,25);
			write('press b to go back,  h untuk hapus status, l untuk lihat status');
			dec:=readkey;
			case dec of
				'b' : lihatbol:=false;
				'l' : pilihstatus(nostatz,idx,tabuser,hashtag);
				'h'	: begin 
						clrscr;
						readln(nohapus);
						hapusstatususer(tabuser,idx,nohapus,temprayz);
						hapusstatusothers(tabuser,idx,nohapus,temprayz);
					end;
			end;
		end
		else n:=1;

	end;	
end;


procedure tampilkanhashtag(var hashtag:h_tagarray;var hast:boolean);
var
	x:string;
	nohashtagx:integer;
	d:char;
	
begin
	while hast=true do begin
	
	clrscr;
	writeln('Masukan hashtag');readln(x);
	if cekhashtag(x,hashtag)=true then begin
	nohashtagx:=searchnohashtag(x,hashtag);
	clrscr;
	bubblesort_hashtagstatus(hashtag[nohashtagx]);
	writeln('#', hashtag[nohashtagx].nama_htag);
	for i:= 1 to totalhashtagstatus(hashtag[nohashtagx])+1 do begin
		writeln('no: ',i,': ');
		writeln('owner: ',hashtag[nohashtagx].isistatus[i].owner);
		writeln(hashtag[nohashtagx].isistatus[i].isi);
		end;
		writeln();
		writeln('tekan b untuk kembali atau key apapun untuk mengulangi');
		d:=readkey;
		case d of
			'b': hast:=false;
		end;
	
		
	end
	else begin
	write('Data tidak ditemukan');
	clrscr;
	end;

end;


end;


begin{program utama}
	menu:=false; sign:=false; log:=false; masuk:=false;keluar:=false;updatebol:=false;lihatbol:=false;hast:=false;
	resetall_hashtag(hashtag);
	resetall_user(tabuser);
	assigndefaultuser(tabuser);
	bubblesort_user(tabuser);
	menureturn(menu,log,sign);
	while keluar=false do begin
		while masuk=false do begin
		signupscreen(menu,log,sign,tabuser);
		loginscreen(menu,log,sign,masuk,tabuser,idx);
		end;
		while masuk=true do begin
			homepagescreen(idx,masuk,tabuser,menustatus,menuhashtag);
			tampilkanhashtag(hashtag,hast);
			
			while menustatus=true do begin	
				menustatusscreen(tabuser,idx,hashtag,menustatus,menuhashtag,updatebol,lihatbol);
				clrscr;
				updatestatus(tabuser,idx,hashtag,temp,tempray,updatebol,lihatbol);
				clrscr;
				lihatstatusscreen(tabuser,idx,updatebol,lihatbol);
				clrscr;
				end;
			end;
		end;
	

	
	

	
	
	
	




readln;
end.