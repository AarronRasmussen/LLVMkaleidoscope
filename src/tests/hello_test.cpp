//
// Created by Aarron on 5/25/2025.
//

#include <gtest/gtest.h>


TEST(HelloTest, BasicAssertions) {
// Expect two strings not to be equal.
EXPECT_STRNE("hello", "world");
// Expect equality.
EXPECT_EQ(7 * 6, 42);
}