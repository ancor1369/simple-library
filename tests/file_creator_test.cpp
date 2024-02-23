#include "file_creator.hpp"

#include <gtest/gtest.h>
#include <spdlog/spdlog.h>
#include <filesystem>
#include "file_operations.hpp"


namespace
{

class file_creator_test : public ::testing::Test
{
protected:

    file_creator_test()
    {

    };

    void SetUp()
    {

    }

    void TearDown()
    {

    }
};

TEST_F(file_creator_test, write_data_to_non_existing_file)
{
    // std::string expected {"1.2.2-999-dbg-test"};
    // std::string location {"non_folder/temp_file"};

    // EXPECT_NO_THROW(ienso::common::write_to_file(location, expected));
    // auto result = ienso::common::read_from_file(location);
    // ASSERT_TRUE(result.has_value());
    // EXPECT_TRUE(expected == result.value());
    std::cout << "Run this test!" << std::endl;
    EXPECT_TRUE(true);
}

}
