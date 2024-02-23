#include "file_creator.hpp"


namespace seneca::example
{

file_creator::file_creator(std::string& file_path)
:m_file_path(file_path)
{
    std::cout << "Files will be created in " << m_file_path << std::endl;
}

file_creator::~file_creator()
{
    std::cout << "Destructor" << std::endl;
}

void file_creator::create_file(nlohmann::json& json_object, std::string& file_name)
{
    std::cout << "Create File " << file_name << "With Content" << json_object.dump(4) <<std::endl;
}

nlohmann::json file_creator::print_file(std::string& file_name)
{
    std::cout << "Print File Content of " << file_name << std::endl;
    return nlohmann::json {};
}

}
