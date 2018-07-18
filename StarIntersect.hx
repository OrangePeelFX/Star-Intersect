import thx.Set;
import sys.io.File;
import sys.FileSystem;

class StarIntersect {  
	
	// Menu du programme
	static public function menu():String{
		#if python
			var cmd = "py StarIntersect.py";
		#else
      var cmd = "StarIntersect";
    #end
		
		var str = " Usage : "+cmd+" -f1 <fichier> -f2 <fichier> -o <fichier> \n";
    str += " Options : \n";
		str += "  -f1 <fichier> : Fichier du 1er dataset\n";
		str += "  -f2 <fichier> : Fichier du 2nd dataset\n";
		str += "  -o  <fichier> : Fichier de sortie de l'intersection\n";
		return str;
  }
	
	// Chargement des dataset
	static public function loadSet(filePath:String):Set<String>{
    // Création du dataset
		var mrcsSet:Set<String> = Set.createString();
					
		// Création de l'expression régulière
		var regexp = ~/ ([0-9]+@.*\/.*)\.mrcs /;		
		
		// Lecture du fichier
		var f = File.read(filePath, false);
    try
    {
      Sys.println(" Lecture du fichier : " + filePath);
      while(true)
      {
				// lecture de la ligne en cours
				var str = f.readLine();
          
				// test de l'expression régulière
				if(regexp.match(str) == true)
				{
					var mrcsPath1 = regexp.matched(1);		
					if(mrcsPath1 != '')
					{
						mrcsSet.add(mrcsPath1);
					}	
				}
      }
    }
    catch( ex:haxe.io.Eof ) 
    {
		}
    f.close();
		
		return mrcsSet;		
  }

	// Ecriture des dataset
	static public function writeSet(filePath:String, mrcsSet:Set<String>){
    // Lecture du fichier
		var f = File.write(filePath, false);
    try
    {
			Sys.println(" Ecriture du fichier de sortie : " + filePath);
      for(line in mrcsSet)
      {
				// Ecriture de chaque ligne
				f.writeString(line + "\n");
			}
    }
    catch( ex:haxe.io.Eof ) 
    {
		}
    f.close();		
  }
	
	// Point d'entrée du programme
  static public function main() {
	
		try {
			// déclaration des variables
			var fileIn1:String = ""; 
			var fileIn2:String = ""; 
			var fileOutput:String = ""; 
			
			// Récupération des arguments		
			var args = Sys.args();
			for (i in 0...args.length) {
				switch args[i] {
				case "-f1" : 
					fileIn1 = args[i+1];					
				case "-f2" :
					fileIn2 = args[i+1];					
				case "-o" :
					fileOutput = args[i+1];					
				}
			}

			if(fileIn1 == "" || fileIn2 == "")
			{
				throw "Merci de renseigner le nom des 2 fichiers";
			}			
			
			if(!FileSystem.exists(fileIn1))
			{
				throw "Le fichier " + fileIn1 + " n'existe pas";
			}
			
			if(!FileSystem.exists(fileIn2))
			{
				throw "Le fichier " + fileIn2 + " n'existe pas";
			}
			
						
			// Déclaration des variables
			var mrcsSet1:Set<String> = loadSet(fileIn1);
			if(mrcsSet1.length == 0)
			{
				throw "Le fichier " + fileIn1 + " ne contient aucune donnée";
			}
			
			var mrcsSet2:Set<String> = loadSet(fileIn2);
			if(mrcsSet2.length == 0)
			{
				throw "Le fichier " + fileIn2 + " ne contient aucune donnée";
			}
			

			var mrcsInter = mrcsSet1.intersection(mrcsSet2);
			var nbResult:Int = mrcsInter.length;
			Sys.println(" Resultats : ");
			Sys.println("  " + fileIn1 + " : " + nbResult + " / " + mrcsSet1.length);
			Sys.println("  " + fileIn2 + " : " + nbResult + " / " + mrcsSet2.length);
			
			if(fileOutput != "")
			{
				writeSet(fileOutput, mrcsInter);
			}			
		} catch( msg : String ) {
			 Sys.println(" Erreur : " + msg );
			 Sys.println(menu());
		} catch( unknown : Dynamic ) {
			 Sys.println(" Erreur : "+Std.string(unknown));
		}
  }
}


