class FileValidator < ActiveModel::EachValidator
    
    def validate_each(record, attribute, value)
        if value 
            if value.respond_to?(:path)
                unless options[:ext].include? File.extname(value.path).delete('.').to_sym                 
                    record.errors[attribute] << "Le format du fichier est incorrect(extensions acceptées: #{options[:ext].join(',')})"
                end
            else
                record.errors[attribute] << (options[:message] || LIB_FICHIER_INCORRECT)
            end
        end
    end
end