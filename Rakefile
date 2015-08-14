require "rake"


/
 Install dotfiles
/
desc "Installs bridgetlane/dotfiles"
task :install do
    puts "  _          _     _            _   _                      __ _       _    __ _ _           \n | |        (_)   | |          | | | |                    / /| |     | |  / _(_) |          \n | |__  _ __ _  __| | __ _  ___| |_| | __ _ _ __   ___   / /_| | ___ | |_| |_ _| | ___  ___ \n | '_ \\| '__| |/ _` |/ _` |/ _ \\ __| |/ _` | '_ \\ / _ \\ / / _` |/ _ \\| __|  _| | |/ _ \\/ __|\n | |_) | |  | | (_| | (_| |  __/ |_| | (_| | | | |  __// / (_| | (_) | |_| | | | |  __/\\__ \\\n |_.__/|_|  |_|\\__,_|\\__, |\\___|\\__|_|\\__,_|_| |_|\\___/_(_)__,_|\\___/ \\__|_| |_|_|\\___||___/\n                      __/ |                                                                 \n                     |___/                                                                  "


    /
     Path information
    /
    root = Dir.home
    path_file = "path.txt"
    files_to_ignore = %W[. .. .DS_Store #{path_file}]
    backup_folder_path = "#{root}/.old_dotfiles_backup"


    /
     Make the backup location
    /
    make_backup_folder(backup_folder_path)


    /
     Symlink all the files
    /
    Dir.glob("*").each do |directory|
        if File.directory?(directory)
            Dir.chdir("#{directory}")

            link_path = find_path(root, path_file)

            (Dir.glob("*", File::FNM_DOTMATCH) - files_to_ignore).each do |file|
                create_symlink(file, link_path, backup_folder_path)
            end

            Dir.chdir(File.dirname(__FILE__))
        end
    end
end


/
 Create a new symlink
/
def create_symlink(file, link_path, backup_folder_path)
    source = "#{Dir.pwd}/#{file}"
    destination = "#{link_path}/#{file}"

    / backup any pre-existing file /
    backup_file(destination, backup_folder_path)

    puts "...symlinking from #{source} to #{destination}"
    FileUtils.symlink(source, destination)
end


/
 If a dotfile already exists, back it up
/
def backup_file(destination, backup_folder_path)
    if File.exist?(destination) || File.symlink?(destination) || File.file?(destination)
        puts "...backing up #{destination}"
        FileUtils.mv(destination, backup_folder_path)
    end
end


/
 Make or detect a backup folder for pre-existing dotfiles
/
def make_backup_folder(backup_folder_path)
    if File.exist?(backup_folder_path) && File.directory?(backup_folder_path)
        puts "USING EXISTING BACKUP FOLDER: #{backup_folder_path}"
    else
        puts "MAKING AND USING BACKUP FOLDER: #{backup_folder_path}"
        Dir.mkdir(backup_folder_path)
    end
end


/
 If path.txt is present, use the non-default path specified in the file
/
def find_path(root, path_file)
    link_path = root
    if File.exist?(path_file)
        File.open(path_file, "r") do |path|
            path.each_line do |line|
                link_path = line.sub('~', root).chomp!
                # puts "Using file path #{link_path} from file #{path_file}"
            end
        end
    else
        # puts "Using default file path #{root}"
    end
    return link_path
end
