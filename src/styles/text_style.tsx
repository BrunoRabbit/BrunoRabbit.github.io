import { defaultTheme } from "./color_style";
import { StyleSheet } from 'react-native';

export const textStyles = StyleSheet.create({
    title: {
        margin: 0,
        padding: 0,
        fontFamily: 'Inter, sans-serif',
        fontWeight: '700',
        color: defaultTheme.colors.grey,
        lineHeight: .4,
        paddingLeft: 6.5,
    },
    description: {
        display: 'flex',
        fontWeight: '600',
        justifyContent: 'flex-end',
        lineHeight: 1.2,
        fontSize: 16,
        letterSpacing: -.2,
    },
    titleProject: {
        fontWeight: '800',
        fontFamily: 'Inter, sans-serif',
        lineHeight: .95,
        letterSpacing: -.5,
    },
    sectionTitle: {
        fontSize: 26,
        fontFamily: 'Inter, sans-serif',
    }
});